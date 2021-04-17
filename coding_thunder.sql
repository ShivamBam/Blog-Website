-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2021 at 11:35 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coding thunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `s_no` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone_no` varchar(14) NOT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`s_no`, `name`, `email`, `phone_no`, `message`, `date`) VALUES
(1, 'first post', 'firstpost@gmail.com', '1525155444', 'this is first post', '2021-04-10 14:13:10'),
(2, 'test name', 'testname@gmail.com', '1212211212', 'this is test msg', NULL),
(3, 'second name', 'secondname@gmail.com', '45454545454', 'second test msg', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `s_no` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `tagline` text NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`s_no`, `title`, `tagline`, `content`, `slug`, `date`) VALUES
(1, 'Lets Learn About Flask', 'The microframework Flask is based on the Pocoo projects', 'Flask is a micro web framework written in Python. It is classified as a microframework because it does not require particular tools or libraries.[2] It has no database abstraction layer, form validation, or any other components where pre-existing third-party libraries provide common functions. However, Flask supports extensions that can add application features as if they were implemented in Flask itself. Extensions exist for object-relational mappers, form validation, upload handling, various open authentication technologies and several common framework related tools.', 'first-post', '2021-04-12 12:35:27'),
(2, 'Programmer', 'This article is about people who write computer software.', 'value=\"A computer programmer, sometimes called a software developer, a programmer or more recently a coder (especially in more informal contexts), is a person who creates computer software. The term computer programmer can refer to a specialist in one area of computers, or to a generalist who writes code for many kinds of software.\r\n\r\nA programmer\'s most often-used computer language (e.g., Assembly, COBOL, C, C++, C#, JavaScript, Lisp, Python, Java) may be prefixed to the term programmer. Some who work with web programming languages also prefix their titles with web\"', 'second-post', '2021-04-15 13:56:33'),
(3, 'Python (programming language)', 'Python consistently ranks as one of the most popular programming languages.', 'Python is an interpreted, high-level and general-purpose programming language. Python\'s design philosophy emphasizes code readability with its notable use of significant indentation. Its language constructs and object-oriented approach aim to help programmers write clear, logical code for small and large-scale projects.[30]\r\n\r\nPython is dynamically-typed and garbage-collected. It supports multiple programming paradigms, including structured (particularly, procedural), object-oriented and functional programming. Python is often described as a \"batteries included\" language due to its comprehensive standard library.[31]\r\n\r\nGuido van Rossum began working on Python in the late 1980s, as a successor to the ABC programming language, and first released it in 1991 as Python 0.9.0.[32] Python 2.0 was released in 2000 and introduced new features, such as list comprehensions and a garbage collection system using reference counting and was discontinued with version 2.7.18 in 2020.[33] Python 3.0 was released in 2008 and was a major revision of the language that is not completely backward-compatible and much Python 2 code does not run unmodified on Python 3.', 'third-post', '2021-04-12 13:59:08'),
(4, 'Lets Learn about Django', 'Django (web framework)', 'Django (/ˈdʒæŋɡoʊ/ JANG-goh; sometimes stylized as django)[8] is a Python-based free and open-source web framework that follows the model-template-views (MTV) architectural pattern.[9][10] It is maintained by the Django Software Foundation (DSF), an American independent organization established as a 501(c)(3) non-profit.\r\n\r\nDjango\'s primary goal is to ease the creation of complex, database-driven websites. The framework emphasizes reusability and \"pluggability\" of components, less code, low coupling, rapid development, and the principle of don\'t repeat yourself.[11] Python is used throughout, even for settings, files, and data models. Django also provides an optional administrative create, read, update and delete interface that is generated dynamically through introspection and configured via admin models.\r\n\r\nSome well known sites that use Django include PBS,[12] Instagram,[13] Mozilla,[14] The Washington Times,[15] Disqus,[16] Bitbucket,[17] and Nextdoor.', 'fourth-post', '2021-04-12 14:00:35'),
(5, 'Bootstrap', '(front-end framework)\r\n', 'Bootstrap is a free and open-source CSS framework directed at responsive, mobile-first front-end web development. It contains CSS- and (optionally) JavaScript-based design templates for typography, forms, buttons, navigation, and other interface components.\r\n\r\nBootstrap is among the most starred projects on GitHub, with more than 142,000 stars, behind freeCodeCamp (almost 312,000 stars) and marginally behind Vue.js framework.', 'fifth-post', '2021-04-12 14:01:50'),
(6, 'HTML', 'The HyperText Markup Language', 'The HyperText Markup Language, or HTML is the standard markup language for documents designed to be displayed in a web browser. It can be assisted by technologies such as Cascading Style Sheets (CSS) and scripting languages such as JavaScript.\r\n\r\nWeb browsers receive HTML documents from a web server or from local storage and render the documents into multimedia web pages. HTML describes the structure of a web page semantically and originally included cues for the appearance of the document.\r\n\r\nHTML elements are the building blocks of HTML pages. With HTML constructs, images and other objects such as interactive forms may be embedded into the rendered page. HTML provides a means to create structured documents by denoting structural semantics for text such as headings, paragraphs, lists, links, quotes and other items. HTML elements are delineated by tags, written using angle brackets. Tags such as <img /> and <input /> directly introduce content into the page. Other tags such as <p> surround and provide information about document text and may include other tags as sub-elements. Browsers do not display the HTML tags, but use them to interpret the content of the page.\r\n\r\nHTML can embed programs written in a scripting language such as JavaScript, which affects the behavior and content of web pages. Inclusion of CSS defines the look and layout of content. The World Wide Web Consortium (W3C), former maintainer of the HTML and current maintainer of the CSS standards, has encouraged the use of CSS over explicit presentational HTML since 1997.', 'sixth-post', '2021-04-12 14:03:03'),
(7, 'test', 'jjksah', 'nkjhaandjk n ', 'new-post', '2021-04-15 13:20:19'),
(9, 'test 2', 'test case second', 'trying', 'test2-post', '2021-04-15 13:21:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`s_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
