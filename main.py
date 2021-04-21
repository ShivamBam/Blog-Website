from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
from flask_mail import Mail
from datetime import datetime
import json
import math
import os


local_server = True
with open('config.json', 'r') as c:
    params = json.load(c)["params"]

app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail_user'],
    MAIL_PASSWORD=params['gmail_password']
)
mail = Mail(app)

if (local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)

class Contacts(db.Model):
    s_no = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(30), nullable=False)
    email = db.Column(db.String(30), nullable=False)
    phone_no = db.Column(db.String(13), nullable=False)
    message = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(20), nullable=True)


class Posts(db.Model):
    s_no = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(30), nullable=False)
    tagline = db.Column(db.String(130), nullable=False)
    content = db.Column(db.String(130), nullable=False)
    slug = db.Column(db.String(25), nullable=False)
    date = db.Column(db.String(20), nullable=True)


@app.route('/')
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
        # Pagination
    posts = posts[(page-1)*int(params['no_of_posts']): (page-1)*int(params['no_of_posts'])+ int(params['no_of_posts'])]
    # First page
    if (page==1):
        prev = "#"
        next = "/?page=" + str(page + 1)

    # Last page
    elif (page==last):
        prev = "/?page=" + str(page - 1)
        next = "#"

    # Middle page
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)


    return render_template('index.html', params=params, posts=posts, prev=prev, next=next)


@app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():
    if ('user' in session and session['user'] == params['admin_user']):
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)


    if request.method=='POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username==params['admin_user'] and userpass==params['admin_pass']):
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params=params, posts=posts)

    return render_template('login.html', params=params)

@app.route('/edit/<string:s_no>', methods=['GET', 'POST'])
def edit(s_no):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == 'POST':
            box_title = request.form.get('title')
            tagline = request.form.get('tagline')
            content = request.form.get('content')
            slug = request.form.get('slug')
            date = datetime.now()

            if s_no == '0':
                post = Posts(title=box_title, tagline=tagline, content=content, slug=slug, date=date)
                db.session.add(post)
                db.session.commit()

            else:
                post = Posts.query.filter_by(s_no=s_no).first()
                post.title = box_title
                post.tagline = tagline
                post.content = content
                post.slug = slug
                post.date = date
                db.session.commit()
                return redirect("/edit/s_no")

        post = Posts.query.filter_by(s_no=s_no).first()
        return render_template('edit.html', params=params, post=post, s_no=s_no)

@app.route('/uploader', methods=['GET', 'POST'])
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == 'POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "upload successfully"

@app.route('/about')
def about():
    return render_template('about.html', params=params)

@app.route('/post/<string:post_slug>', methods=['GET'])
def sample_post(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/delete/<string:s_no>", methods = ['GET', 'POST'])
def delete(s_no):
    if ('user' in session and session['user'] == params['admin_user']):
        post = Posts.query.filter_by(s_no=s_no).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')

@app.route('/contact', methods = ['POST', 'GET'])
def contact():
    if request.method == 'POST':
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, email=email, phone_no=phone, message=message, date=datetime.now)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name,
                          sender=email,
                          recipients=[params['gmail_user']],
                          body=message + "/n" + phone
                          )
    return render_template('contact.html', params=params)

app.run(debug=True)