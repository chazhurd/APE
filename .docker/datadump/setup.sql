
/* CREATE USER 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'%'; */

CREATE DATABASE IF NOT EXISTS ape_database;
USE ape_database;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ape_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_setting`
--

CREATE TABLE `admin_setting` (
  `name` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_setting`
--

INSERT INTO `admin_setting` (`name`, `value`) VALUES
('catGraderLimit', '3'),
('pointDiffRange', '5'),
('fallStart', '2017-09-20'),
('fallEnd', '2017-12-08'),
('winterStart', '2018-01-08'),
('winterEnd', '2018-03-23'),
('springStart', '2018-04-02'),
('springEnd', '2018-06-15'),
('summerStart', '2018-06-25'),
('summerEnd', '2018-08-17'),
('contactEmail', 'ssteiner@ewu.edu'),
('contactName', 'Stu Steiner');

-- --------------------------------------------------------

--
-- Table structure for table `assigned_grader`
--

CREATE TABLE `assigned_grader` (
  `grader_exam_cat_id` int(11) NOT NULL,
  `exam_cat_id` int(11) NOT NULL,
  `user_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `name`) VALUES
(1, 'Recursion'),
(2, 'Linked List'),
(3, 'General'),
(4, 'Data Abstraction');

-- --------------------------------------------------------

--
-- Table structure for table `category_grade`
--

CREATE TABLE `category_grade` (
  `grader_exam_cat_id` int(11) NOT NULL,
  `student_id` varchar(15) NOT NULL,
  `grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `exam_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quarter` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `location` int(11) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `passing_grade` int(11) NOT NULL,
  `possible_grade` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `cutoff` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_category`
--

CREATE TABLE `exam_category` (
  `exam_cat_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `possible_grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_grade`
--

CREATE TABLE `exam_grade` (
  `exam_id` int(11) NOT NULL,
  `student_id` varchar(15) NOT NULL,
  `grade` int(11) NOT NULL,
  `passed` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_roster`
--

CREATE TABLE `exam_roster` (
  `exam_id` int(11) NOT NULL,
  `student_id` varchar(15) NOT NULL,
  `seat_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` varchar(15) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `type`) VALUES
('000', '000'),
('00046759', 'Admin'),
('00046759', 'Grader'),
('00046759', 'Teacher'),
('00110458', 'Admin'),
('00110458', 'Grader'),
('00110458', 'Teacher'),
('999999', 'System');

-- --------------------------------------------------------

--
-- Table structure for table `homepage_content`
--

CREATE TABLE `homepage_content` (
  `content_id` int(11) NOT NULL,
  `title` text,
  `html_content` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `homepage_content`
--

INSERT INTO `homepage_content` (`content_id`, `title`, `html_content`) VALUES
(1, 'Exam Environment', '&lt;p&gt;Linux Operating System&lt;/p&gt;&lt;p&gt;Editors&lt;/p&gt;&lt;ul&gt;&lt;li&gt;JGrasp&lt;/li&gt;&lt;li&gt;GEdit&lt;/li&gt;&lt;li&gt;Eclipse&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;JDK 8.0 (1.8.x)&lt;/p&gt;&lt;p&gt;Java API Documentation&lt;/p&gt;&lt;p&gt;No Internet access&lt;/p&gt;&lt;p&gt;No notes or texts allowed&lt;/p&gt;&lt;p&gt;The exam is now a Test Driven Design Exam where you are writing code based on the provided tests&lt;br&gt;&lt;/p&gt;'),
(2, 'Exam Specififcs', '&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;The Computer Science Department has determined that the distribution of points within the exam will be as follows:&lt;/span&gt;&lt;/p&gt;&lt;hr&gt;&lt;p&gt;&lt;b&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;General Program Design: 30%&lt;/span&gt;&lt;/b&gt;&lt;br&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Penalty points can be assessed in this category for grossly inefficient code&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;File input and output&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Exception handling&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Order-related manipulations, such as &lt;/span&gt;&lt;b&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;addOrdered, sort&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;, and &lt;/span&gt;&lt;b&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;search&lt;/span&gt;&lt;/b&gt;&lt;/li&gt;&lt;/ul&gt;&lt;hr&gt;&lt;p&gt;&lt;b&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Data Abstraction and Class Design: 30%&lt;/span&gt;&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Extending a class&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Overriding a method, such as toString&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Creating a class&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Accessing super class methods and/or fields&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Implementing an interface, such as Comparable&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;hr&gt;&lt;p&gt;&lt;b&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Linked List Manipulation: 20%&lt;/span&gt;&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;This will be a non-circular singly-linked list, either with or without a header/sentinel node&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Operations will be &lt;/span&gt;&lt;b&gt;&lt;i&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;chosen &lt;/span&gt;&lt;/i&gt;&lt;/b&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;from the following list&lt;/span&gt;&lt;/li&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Adding a node â€” all cases (to an empty list, to a non-empty list, at front, at back, in the middle)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Remove a node â€” all cases (based on index, based on Object equality, from front, from back, from middle)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Retrieve an item based on index or some other criterion (such as maximum or minimum)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Order-related manipulations, such as addOrdered and sort, may be exemplified within the linked list&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Generate a sublist based on some criterion or criteria.&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/ul&gt;&lt;hr&gt;&lt;p&gt;&lt;b&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Recursion: 20%&lt;/span&gt;&lt;/b&gt;&lt;br&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Simple recursive methods to accomplish a task, which may or may not be list related. Examples would be printing a linked list in reverse, computation of factorials, and other recursive algorithms at the level of those covered in Programming Principles I and II and in Data Structures.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;An example you probably haven\'t seen: &lt;/span&gt;&lt;a href=&quot;http://penguin.ewu.edu/cscd300/Topic/Recursion/AdditiveSquares.java&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;AdditiveSquares.java&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;hr&gt;&lt;p&gt;&lt;b&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;EXPANDED SPECIFICS&lt;/span&gt;&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;An expanded list of topics follows.&amp;nbsp; You should make sure you are proficient in each area to ensure success.&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Linked list utilization (a subset of the below items will be required)&lt;/span&gt;&lt;/li&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;insert (front, back, in order)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;delete (front, back, specific item)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;print&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;traverse&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;sort(you must write the code, unless otherwise specified)&amp;nbsp; Note, however, that you may be asked to do array-oriented sorting.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;build a sub-list from an existing list&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;utilize a dummy head node â€” or not utilize one&lt;br&gt;&lt;br&gt;&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;li&gt;Basic recursion (like using recursion to traverse a linked list in some form, or print the contents of a linked list in reverse order)&lt;br&gt;&lt;br&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;File input and output&lt;/span&gt;&lt;/li&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Input via a Scanner object&lt;/span&gt;&lt;/li&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;any input file will be well formed&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to stop when end of file is reached&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;remember to close file when finished&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Output via PrintWriter&lt;/span&gt;&lt;/li&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to format output (decimal points, columns, etc.)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;remember to close output file when finished&lt;br&gt;&lt;br&gt;&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Inheritance&lt;/span&gt;&lt;/li&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Understand base / derived relationship&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to override methods to enable polymorphic behavior&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;understand abstract classes and interfaces&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to derive a class from an existing class&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to call base/parent/super class methods (requires use of keyword super)&lt;br&gt;&lt;br&gt;&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Comparable interface&lt;/span&gt;&lt;/li&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to implement for a given class, including multiple-key comparisons&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to utilize when searching and sorting (i.e. call the compareTo method)&lt;br&gt;&lt;br&gt;&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Basic exception handling&lt;/span&gt;&lt;/li&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to designate a section of code as possibly throwing an execption (via a try block)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to handle and exception (via a catch block)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to propagate an exception from a method (by using throws and the end of the method signature)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to generically handle an exception (use Exception to do this)&lt;br&gt;&lt;br&gt;&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;toString&lt;/span&gt;&lt;/li&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to implement properly for a given class&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to utilize an existing toString provided by a class (recall that it returns a String representing data in the object you\'d like printed and that it is automatically invoked whenever you try and print an object using print, println, or printf with the &quot;%s&quot; format specifier)&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;This exam covers material very similar to that in the warm-up assignment in Data Structures (CSCD300), or possibly the warm-up assignment and the second programming assignment.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;You will not have to start from scratch on the exam.&amp;nbsp; You will be given a (previously) working program that has had functionality removed.&amp;nbsp; It is your job to reinsert that functionality.&amp;nbsp; For the most part, this will be done via adding methods.&amp;nbsp; You will be told in some way what methods are required.&amp;nbsp; You may be asked to write a class in its entirety.&amp;nbsp; However, if you are asked to write an entire class the amount of code you will be required to write is not intended to be â€œlarge.â€&amp;nbsp; Questions will be asked in â€œpartsâ€ that can be done separately.&amp;nbsp; This means if you mess up on part 1, and part 2 requires something from part 1, you will not need to have completed part 1 successfully to do part 2.&lt;/span&gt;&lt;/p&gt;'),
(3, 'Problem Areas Identified From Previous Exams', '&lt;ul&gt;&lt;li&gt;Not following directions&lt;/li&gt;&lt;li&gt;Not reading the specifications in their entirety â€” make sure you read all directions before you begin writing code.&amp;nbsp; A prime example is ignoring specifications related to whether the linked list does or does not have a header/sentinel node.&lt;/li&gt;&lt;li&gt;Not placing files in specified location&lt;/li&gt;&lt;li&gt;Not naming files as specified&lt;/li&gt;&lt;li&gt;Modifying files that were to be left alone&lt;/li&gt;&lt;li&gt;Unfamiliarity with keywords in Java required for basic things like inheritance (extends) and interface use (implements)&lt;/li&gt;&lt;li&gt;Spending too much time on one item&lt;/li&gt;&lt;li&gt;Inability to implement simple recursion&lt;/li&gt;&lt;/ul&gt;'),
(4, 'Basic Strategies You Should Use', '&lt;ul&gt;&lt;li&gt;Stub the methods out that you have to write, then fill them in with useful code when you are ready&lt;/li&gt;&lt;li&gt;Read the directions carefully, then look at the sample input and output before you begin writing code&lt;/li&gt;&lt;li&gt;Comment out items that don\'t compile so you can test other parts of your solution (this includes methods you can\'t get to work and method calls that may occur from elsewhere â€” like in the main method of the program).&amp;nbsp; Note, however, that your code will be tested using the original driver file, not your edited one.&lt;/li&gt;&lt;/ul&gt;'),
(5, 'Practice Exams', '&lt;p&gt;&lt;/p&gt;&lt;ul&gt;\n&lt;li&gt;&lt;a href=&quot;http://penguin.ewu.edu/advancement_exam/practice_exams/W11APE.zip&quot;&gt;Winter 2011 Student Version&lt;/a&gt;&lt;/li&gt;\n&lt;li&gt;&lt;a title=&quot;Sample APE Solution&quot; href=&quot;http://penguin.ewu.edu/advancement_exam/practice_exams/W11FullAPE.zip&quot;&gt;Winter 2011 Solution&lt;/a&gt;&lt;/li&gt;\n&lt;li&gt;&lt;a href=&quot;http://penguin.ewu.edu/advancement_exam/practice_exams/W12APE.zip&quot;&gt;Winter 2012 Student Version&lt;/a&gt;&lt;/li&gt;\n&lt;li&gt;&lt;a title=&quot;Summer 2013 Student APE&quot; href=&quot;http://penguin.ewu.edu/advancement_exam/practice_exams/Summer2013APE.zip&quot; target=&quot;_blank&quot;&gt;Summer 2013 Student Version&lt;/a&gt;&lt;/li&gt;\n&lt;li&gt;Summer 2017 APE: Includes Eclipse project with unit tests&lt;/li&gt;\n&lt;ul&gt;\n&lt;li&gt;&lt;a href=&quot;http://penguin.ewu.edu/advancement_exam/practice_exams/Summer2017APE.zip&quot;&gt;Student Version&lt;/a&gt;&lt;/li&gt;\n&lt;li&gt;&lt;a href=&quot;http://penguin.ewu.edu/advancement_exam/practice_exams/Summer2017APESolution.zip&quot;&gt;Solution&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/ul&gt;&lt;p&gt;NOTE: This is just a sample exam â€” do not expect the exam you take to be formatted in precisely the same way, with the same number of classes, methods, etc. â€” this is just for practice and to give you an idea of what to expect.&amp;nbsp; The amount of code you are asked to write on this exam is similar to the amount you will have to write on the actual exam.&amp;nbsp; The topics on this exam are a selection from the list given at the top of this web page; the actual exam you take may have topics not addressed on this exam, but which are a part of the list above.&lt;/p&gt;'),
(6, 'NOTES', '&lt;ul&gt;&lt;li&gt;&lt;b style=&quot;color: rgb(206, 0, 0);&quot;&gt;Any student requesting accomodations based on DSS, must send an email to tcapaul@ewu.edu at least one week prior to the exam.&lt;/b&gt;&lt;/li&gt;&lt;li&gt;You are allowed to take the APE only three (3) times without passing.&lt;/li&gt;&lt;li&gt;It is your responsibility to register for the exam online. If you show up to the exam without registering, you may be turned away&lt;/li&gt;&lt;li&gt;Online registration is done through this page.&lt;/li&gt;&lt;/ul&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `in_class_exam`
--

CREATE TABLE `in_class_exam` (
  `exam_id` int(11) NOT NULL,
  `teacher_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `in_class_student`
--

CREATE TABLE `in_class_student` (
  `student_id` varchar(15) NOT NULL,
  `teacher_id` varchar(15) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `loc_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` varchar(15) NOT NULL,
  `state` varchar(15) NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `edited_by` varchar(15) NOT NULL DEFAULT '999999'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_cat_grade`
--

CREATE TABLE `student_cat_grade` (
  `student_id` varchar(15) NOT NULL,
  `exam_cat_id` int(11) NOT NULL,
  `final_grade` int(11) NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `edited_by` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(15) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `f_name`, `l_name`, `email`, `disabled`) VALUES
('000', '000', '000', '000', 0),
('00046759', 'Stu', 'Steiner', 'ssteiner@ewu.edu', 0),
('00110458', 'Tom', 'Capaul', 'tcapaul@ewu.edu', 0),
('999999', 'System', 'System', 'system@ape', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assigned_grader`
--
ALTER TABLE `assigned_grader`
  ADD PRIMARY KEY (`grader_exam_cat_id`),
  ADD UNIQUE KEY `exam_cat_id` (`exam_cat_id`,`user_id`),
  ADD KEY `exam_cat_id_fk` (`exam_cat_id`),
  ADD KEY `grader_id_fk` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `category_grade`
--
ALTER TABLE `category_grade`
  ADD PRIMARY KEY (`grader_exam_cat_id`,`student_id`),
  ADD KEY `assigned_exam_id_fk` (`grader_exam_cat_id`),
  ADD KEY `student_id_fk` (`student_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`exam_id`),
  ADD KEY `loc_fkey` (`location`);

--
-- Indexes for table `exam_category`
--
ALTER TABLE `exam_category`
  ADD PRIMARY KEY (`exam_cat_id`),
  ADD UNIQUE KEY `cat_id` (`cat_id`,`exam_id`),
  ADD KEY `exam_foreign_key` (`exam_id`),
  ADD KEY `examcat_category_key` (`cat_id`);

--
-- Indexes for table `exam_grade`
--
ALTER TABLE `exam_grade`
  ADD PRIMARY KEY (`exam_id`,`student_id`),
  ADD KEY `exam_id_fkey` (`exam_id`),
  ADD KEY `student_id_fkey` (`student_id`);

--
-- Indexes for table `exam_roster`
--
ALTER TABLE `exam_roster`
  ADD PRIMARY KEY (`exam_id`,`student_id`),
  ADD UNIQUE KEY `exam_id` (`exam_id`,`seat_num`),
  ADD KEY `exam_fkey` (`exam_id`),
  ADD KEY `student_fkey` (`student_id`) USING BTREE;

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`,`type`);

--
-- Indexes for table `homepage_content`
--
ALTER TABLE `homepage_content`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `in_class_exam`
--
ALTER TABLE `in_class_exam`
  ADD PRIMARY KEY (`exam_id`,`teacher_id`),
  ADD KEY `exam_fkey` (`exam_id`),
  ADD KEY `teacher_fkey` (`teacher_id`);

--
-- Indexes for table `in_class_student`
--
ALTER TABLE `in_class_student`
  ADD UNIQUE KEY `student_id` (`student_id`,`teacher_id`,`start_date`,`end_date`),
  ADD KEY `teacher_id_fkey` (`teacher_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`loc_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `student_ibfk_2` (`edited_by`);

--
-- Indexes for table `student_cat_grade`
--
ALTER TABLE `student_cat_grade`
  ADD PRIMARY KEY (`student_id`,`exam_cat_id`),
  ADD KEY `exam_cat_id_fkey` (`exam_cat_id`),
  ADD KEY `edited_by_fk` (`edited_by`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assigned_grader`
--
ALTER TABLE `assigned_grader`
  MODIFY `grader_exam_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1102;

--
-- AUTO_INCREMENT for table `exam_category`
--
ALTER TABLE `exam_category`
  MODIFY `exam_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `homepage_content`
--
ALTER TABLE `homepage_content`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `loc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assigned_grader`
--
ALTER TABLE `assigned_grader`
  ADD CONSTRAINT `exam_cat_id_fk` FOREIGN KEY (`exam_cat_id`) REFERENCES `exam_category` (`exam_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grader_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `category_grade`
--
ALTER TABLE `category_grade`
  ADD CONSTRAINT `assigned_exam_id_fk` FOREIGN KEY (`grader_exam_cat_id`) REFERENCES `assigned_grader` (`grader_exam_cat_id`),
  ADD CONSTRAINT `student_id_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `loc_fkey` FOREIGN KEY (`location`) REFERENCES `location` (`loc_id`);

--
-- Constraints for table `exam_category`
--
ALTER TABLE `exam_category`
  ADD CONSTRAINT `examcat_category_key` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`),
  ADD CONSTRAINT `examcat_exam_key` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam_grade`
--
ALTER TABLE `exam_grade`
  ADD CONSTRAINT `exam_id_fkey` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`),
  ADD CONSTRAINT `student_fkey` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `exam_roster`
--
ALTER TABLE `exam_roster`
  ADD CONSTRAINT `exam_roster_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `exam_roster_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION;

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `in_class_exam`
--
ALTER TABLE `in_class_exam`
  ADD CONSTRAINT `exam_fkey` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teacher_fkey` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `in_class_student`
--
ALTER TABLE `in_class_student`
  ADD CONSTRAINT `student_id_fkey` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `teacher_id_fkey` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`edited_by`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `student_cat_grade`
--
ALTER TABLE `student_cat_grade`
  ADD CONSTRAINT `edited_by_fk` FOREIGN KEY (`edited_by`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `exam_cat_id_fkey` FOREIGN KEY (`exam_cat_id`) REFERENCES `exam_category` (`exam_cat_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `student_cat_grade_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';
-- MySQL dump 10.15  Distrib 10.0.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ape_database
-- ------------------------------------------------------
-- Server version	10.0.38-MariaDB-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_setting`
--

DROP TABLE IF EXISTS `admin_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_setting` (
  `name` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_setting`
--

LOCK TABLES `admin_setting` WRITE;
/*!40000 ALTER TABLE `admin_setting` DISABLE KEYS */;
INSERT INTO `admin_setting` VALUES ('catGraderLimit','3'),('pointDiffRange','5'),('fallStart','2019-09-25'),('fallEnd','2019-12-13'),('winterStart','2020-01-06'),('winterEnd','2020-03-20'),('springStart','2020-03-30'),('springEnd','2020-06-12'),('summerStart','2020-06-22'),('summerEnd','2020-08-14'),('contactEmail','tcapaul@ewu.edu'),('contactName','Tom Capaul');
/*!40000 ALTER TABLE `admin_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assigned_grader`
--

DROP TABLE IF EXISTS `assigned_grader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assigned_grader` (
  `grader_exam_cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_cat_id` int(11) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  PRIMARY KEY (`grader_exam_cat_id`),
  UNIQUE KEY `exam_cat_id` (`exam_cat_id`,`user_id`),
  KEY `exam_cat_id_fk` (`exam_cat_id`),
  KEY `grader_id_fk` (`user_id`),
  CONSTRAINT `exam_cat_id_fk` FOREIGN KEY (`exam_cat_id`) REFERENCES `exam_category` (`exam_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grader_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned_grader`
--

LOCK TABLES `assigned_grader` WRITE;
/*!40000 ALTER TABLE `assigned_grader` DISABLE KEYS */;
INSERT INTO `assigned_grader` VALUES (5,5,'00110458'),(6,6,'00110458'),(7,7,'00110458'),(8,8,'00110458'),(9,9,'00110458'),(10,10,'00110458'),(11,11,'00110458'),(12,12,'00110458'),(16,13,'00110458'),(14,14,'00110458'),(13,15,'00110458'),(15,16,'00110458'),(19,17,'00110458'),(18,18,'00110458'),(17,19,'00110458'),(20,20,'00110458'),(21,21,'00110458'),(22,22,'00110458'),(23,23,'00110458'),(24,24,'00110458'),(26,25,'00110458'),(25,26,'00110458'),(28,27,'00110458'),(27,28,'00110458'),(30,29,'00110458'),(31,30,'00110458'),(29,31,'00110458'),(32,32,'00110458'),(33,33,'00110458'),(36,34,'00110458'),(34,35,'00110458'),(35,36,'00110458'),(37,37,'00110458'),(38,38,'00110458'),(40,39,'00110458'),(39,40,'00110458');
/*!40000 ALTER TABLE `assigned_grader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Recursion'),(2,'Linked List'),(3,'General'),(4,'Data Abstraction');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_grade`
--

DROP TABLE IF EXISTS `category_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_grade` (
  `grader_exam_cat_id` int(11) NOT NULL,
  `student_id` varchar(15) NOT NULL,
  `grade` int(11) NOT NULL,
  PRIMARY KEY (`grader_exam_cat_id`,`student_id`),
  KEY `assigned_exam_id_fk` (`grader_exam_cat_id`),
  KEY `student_id_fk` (`student_id`),
  CONSTRAINT `assigned_exam_id_fk` FOREIGN KEY (`grader_exam_cat_id`) REFERENCES `assigned_grader` (`grader_exam_cat_id`),
  CONSTRAINT `student_id_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_grade`
--

LOCK TABLES `category_grade` WRITE;
/*!40000 ALTER TABLE `category_grade` DISABLE KEYS */;
INSERT INTO `category_grade` VALUES (5,'00101087',12),(5,'00234980',16),(5,'00497657',20),(5,'00660885',11),(5,'00665442',16),(5,'00703588',16),(5,'00720081',13),(5,'00761221',8),(5,'00762578',20),(5,'00773500',16),(5,'00774443',20),(5,'00782838',12),(5,'00788720',20),(5,'00798522',16),(5,'00809142',18),(5,'00809260',11),(5,'00818407',9),(5,'00818813',20),(5,'00823483',16),(5,'00826552',13),(5,'00854656',8),(5,'00855412',20),(5,'00860827',7),(5,'00864761',8),(5,'00869654',16),(6,'00101087',25),(6,'00234980',30),(6,'00497657',25),(6,'00660885',17),(6,'00665442',29),(6,'00703588',28),(6,'00720081',28),(6,'00761221',27),(6,'00762578',29),(6,'00773500',29),(6,'00774443',30),(6,'00782838',29),(6,'00788720',30),(6,'00798522',28),(6,'00809142',28),(6,'00809260',30),(6,'00818407',30),(6,'00818813',29),(6,'00823483',28),(6,'00826552',28),(6,'00854656',28),(6,'00855412',25),(6,'00860827',17),(6,'00864761',17),(6,'00869654',29),(7,'00101087',14),(7,'00234980',27),(7,'00497657',30),(7,'00660885',20),(7,'00665442',20),(7,'00703588',29),(7,'00720081',29),(7,'00761221',24),(7,'00762578',30),(7,'00773500',24),(7,'00774443',29),(7,'00782838',29),(7,'00788720',30),(7,'00798522',30),(7,'00809142',25),(7,'00809260',15),(7,'00818407',22),(7,'00818813',30),(7,'00823483',27),(7,'00826552',19),(7,'00854656',17),(7,'00855412',30),(7,'00860827',6),(7,'00864761',4),(7,'00869654',22),(8,'00101087',7),(8,'00234980',7),(8,'00497657',20),(8,'00660885',8),(8,'00665442',20),(8,'00703588',15),(8,'00720081',13),(8,'00761221',6),(8,'00762578',12),(8,'00773500',16),(8,'00774443',20),(8,'00782838',20),(8,'00788720',20),(8,'00798522',20),(8,'00809142',9),(8,'00809260',3),(8,'00818407',20),(8,'00818813',20),(8,'00823483',17),(8,'00826552',14),(8,'00854656',7),(8,'00855412',20),(8,'00860827',1),(8,'00864761',20),(8,'00869654',1),(9,'00101087',10),(9,'00605013',4),(9,'00622901',20),(9,'00626064',10),(9,'00683416',18),(9,'00684133',20),(9,'00690652',19),(9,'00715879',20),(9,'00740311',14),(9,'00747162',8),(9,'00750215',15),(9,'00768135',20),(9,'00779193',20),(9,'00800585',18),(9,'00800724',20),(9,'00803414',20),(9,'00811072',15),(9,'00824242',19),(9,'00826552',15),(9,'00833384',17),(9,'00835796',20),(9,'00863328',20),(9,'00864955',20),(9,'00866912',20),(9,'00869654',20),(10,'00101087',26),(10,'00605013',9),(10,'00622901',4),(10,'00626064',30),(10,'00683416',29),(10,'00684133',30),(10,'00690652',15),(10,'00715879',30),(10,'00740311',26),(10,'00747162',22),(10,'00750215',27),(10,'00768135',30),(10,'00779193',22),(10,'00800585',26),(10,'00800724',26),(10,'00803414',24),(10,'00811072',30),(10,'00824242',21),(10,'00826552',30),(10,'00833384',26),(10,'00835796',28),(10,'00863328',30),(10,'00864955',30),(10,'00866912',17),(10,'00869654',30),(11,'00101087',10),(11,'00605013',0),(11,'00622901',0),(11,'00626064',10),(11,'00683416',14),(11,'00684133',20),(11,'00690652',16),(11,'00715879',20),(11,'00740311',4),(11,'00747162',6),(11,'00750215',13),(11,'00768135',16),(11,'00779193',12),(11,'00800585',15),(11,'00800724',19),(11,'00803414',15),(11,'00811072',17),(11,'00824242',14),(11,'00826552',20),(11,'00833384',11),(11,'00835796',16),(11,'00863328',20),(11,'00864955',20),(11,'00866912',16),(11,'00869654',20),(12,'00101087',7),(12,'00605013',19),(12,'00622901',9),(12,'00626064',25),(12,'00683416',23),(12,'00684133',30),(12,'00690652',30),(12,'00715879',26),(12,'00740311',19),(12,'00747162',23),(12,'00750215',25),(12,'00768135',30),(12,'00779193',30),(12,'00800585',25),(12,'00800724',23),(12,'00803414',23),(12,'00811072',30),(12,'00824242',17),(12,'00826552',30),(12,'00833384',26),(12,'00835796',23),(12,'00863328',30),(12,'00864955',30),(12,'00866912',27),(12,'00869654',30),(33,'00405335',15),(33,'00614668',20),(33,'00662920',7),(33,'00676293',8),(33,'00695519',19),(33,'00695979',16),(33,'00705745',6),(33,'00720082',13),(33,'00720988',2),(33,'00743320',9),(33,'00743512',11),(33,'00745190',20),(33,'00745919',19),(33,'00802207',3),(33,'00811872',2),(33,'00829937',6),(33,'00830717',2),(33,'00831433',10),(33,'00833794',19),(33,'00837566',8),(33,'00838382',7),(33,'00841467',16),(33,'00842417',15),(33,'00852001',4),(33,'00855923',2),(33,'00855930',0),(33,'00860978',5),(33,'00861401',19),(33,'00862422',6),(33,'00863485',8),(33,'00864163',17),(33,'00865390',5),(33,'00868935',7),(33,'00870215',7),(33,'00871388',20),(33,'00872491',8),(33,'00880260',16),(33,'00882149',20),(33,'00884801',3),(33,'00897833',16),(33,'00898793',7),(33,'00899128',20),(33,'00904365',4),(33,'00921490',4),(34,'00405335',3),(34,'00614668',30),(34,'00662920',0),(34,'00676293',22),(34,'00695519',28),(34,'00695979',26),(34,'00705745',7),(34,'00720082',17),(34,'00720988',12),(34,'00743320',22),(34,'00743512',0),(34,'00745190',22),(34,'00745919',27),(34,'00802207',22),(34,'00811872',15),(34,'00829937',30),(34,'00830717',18),(34,'00831433',30),(34,'00833794',22),(34,'00837566',14),(34,'00838382',12),(34,'00841467',26),(34,'00842417',24),(34,'00852001',15),(34,'00855923',14),(34,'00855930',10),(34,'00860978',18),(34,'00861401',30),(34,'00862422',14),(34,'00863485',12),(34,'00864163',27),(34,'00865390',14),(34,'00868935',14),(34,'00870215',19),(34,'00871388',30),(34,'00872491',17),(34,'00880260',22),(34,'00882149',22),(34,'00884801',8),(34,'00897833',29),(34,'00898793',22),(34,'00899128',30),(34,'00904365',22),(34,'00921490',4),(35,'00405335',19),(35,'00614668',20),(35,'00662920',0),(35,'00676293',1),(35,'00695519',20),(35,'00695979',13),(35,'00705745',0),(35,'00720082',2),(35,'00720988',0),(35,'00743320',7),(35,'00743512',7),(35,'00745190',20),(35,'00745919',13),(35,'00802207',5),(35,'00811872',1),(35,'00829937',5),(35,'00830717',0),(35,'00831433',8),(35,'00833794',12),(35,'00837566',7),(35,'00838382',0),(35,'00841467',15),(35,'00842417',14),(35,'00852001',0),(35,'00855923',2),(35,'00855930',4),(35,'00860978',1),(35,'00861401',20),(35,'00862422',1),(35,'00863485',0),(35,'00864163',7),(35,'00865390',5),(35,'00868935',1),(35,'00870215',14),(35,'00871388',20),(35,'00872491',9),(35,'00880260',12),(35,'00882149',13),(35,'00884801',0),(35,'00897833',12),(35,'00898793',0),(35,'00899128',20),(35,'00904365',7),(35,'00921490',3),(36,'00405335',30),(36,'00614668',30),(36,'00662920',9),(36,'00676293',30),(36,'00695519',30),(36,'00695979',25),(36,'00705745',22),(36,'00720082',23),(36,'00720988',0),(36,'00743320',18),(36,'00743512',20),(36,'00745190',30),(36,'00745919',30),(36,'00802207',11),(36,'00811872',10),(36,'00829937',23),(36,'00830717',20),(36,'00831433',23),(36,'00833794',30),(36,'00837566',30),(36,'00838382',10),(36,'00841467',29),(36,'00842417',27),(36,'00852001',23),(36,'00855923',21),(36,'00855930',19),(36,'00860978',16),(36,'00861401',30),(36,'00862422',30),(36,'00863485',22),(36,'00864163',29),(36,'00865390',23),(36,'00868935',23),(36,'00870215',23),(36,'00871388',30),(36,'00872491',9),(36,'00880260',18),(36,'00882149',30),(36,'00884801',13),(36,'00897833',30),(36,'00898793',20),(36,'00899128',30),(36,'00904365',19),(36,'00921490',0);
/*!40000 ALTER TABLE `category_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `quarter` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `location` int(11) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `passing_grade` int(11) NOT NULL,
  `possible_grade` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `cutoff` int(11) NOT NULL,
  PRIMARY KEY (`exam_id`),
  KEY `loc_fkey` (`location`),
  CONSTRAINT `loc_fkey` FOREIGN KEY (`location`) REFERENCES `location` (`loc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,'Winter 2018 APE','Winter','2018-02-09',4,'Archived',80,100,4,'14:00:00',6),(2,'Spring 2018 APE','Spring','2018-05-04',4,'Archived',80,100,4,'14:00:00',6),(3,'Summer 2018 APE','Summer','2018-07-20',4,'Archived',80,100,4,'10:00:00',12),(4,'Fall 2018 APE','Fall','2018-10-19',4,'Archived',75,100,4,'14:00:00',24),(5,'Winter 2019 APE','Winter','2019-02-08',4,'Archived',80,100,4,'14:00:00',24),(6,'Spring 2019 APE','Spring','2019-04-26',4,'Archived',80,100,4,'14:00:00',24),(7,'Summer 2019 APE','Summer','2019-07-19',4,'Archived',80,100,4,'10:00:00',12),(8,'Fall 2019 APE','Fall','2019-10-18',4,'Archived',80,100,4,'14:00:00',24),(9,'Winter 2020 APE','Winter','2020-01-31',4,'Open',80,100,4,'14:00:00',24);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_category`
--

DROP TABLE IF EXISTS `exam_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_category` (
  `exam_cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `possible_grade` int(11) NOT NULL,
  PRIMARY KEY (`exam_cat_id`),
  UNIQUE KEY `cat_id` (`cat_id`,`exam_id`),
  KEY `exam_foreign_key` (`exam_id`),
  KEY `examcat_category_key` (`cat_id`),
  CONSTRAINT `examcat_category_key` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`),
  CONSTRAINT `examcat_exam_key` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_category`
--

LOCK TABLES `exam_category` WRITE;
/*!40000 ALTER TABLE `exam_category` DISABLE KEYS */;
INSERT INTO `exam_category` VALUES (5,2,1,20),(6,4,1,30),(7,3,1,30),(8,1,1,20),(9,2,2,20),(10,3,2,30),(11,1,2,20),(12,4,2,30),(13,3,3,30),(14,4,3,30),(15,2,3,20),(16,1,3,20),(17,1,4,20),(18,4,4,30),(19,2,4,20),(20,3,4,30),(21,1,5,20),(22,3,5,30),(23,2,5,20),(24,4,5,30),(25,3,6,30),(26,1,6,20),(27,4,6,30),(28,2,6,20),(29,2,7,20),(30,3,7,30),(31,4,7,30),(32,1,7,20),(33,2,8,20),(34,3,8,30),(35,4,8,30),(36,1,8,20),(37,4,9,30),(38,3,9,30),(39,2,9,20),(40,1,9,20);
/*!40000 ALTER TABLE `exam_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_grade`
--

DROP TABLE IF EXISTS `exam_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_grade` (
  `exam_id` int(11) NOT NULL,
  `student_id` varchar(15) NOT NULL,
  `grade` int(11) NOT NULL,
  `passed` tinyint(4) NOT NULL,
  PRIMARY KEY (`exam_id`,`student_id`),
  KEY `exam_id_fkey` (`exam_id`),
  KEY `student_id_fkey` (`student_id`),
  CONSTRAINT `exam_id_fkey` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`),
  CONSTRAINT `student_fkey` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_grade`
--

LOCK TABLES `exam_grade` WRITE;
/*!40000 ALTER TABLE `exam_grade` DISABLE KEYS */;
INSERT INTO `exam_grade` VALUES (1,'00101087',53,0),(1,'00234980',91,1),(1,'00497657',95,1),(1,'00660885',56,0),(1,'00665442',85,1),(1,'00703588',88,1),(1,'00720081',90,1),(1,'00761221',65,0),(1,'00762578',91,1),(1,'00773500',85,1),(1,'00774443',99,1),(1,'00782838',90,1),(1,'00788720',100,1),(1,'00798522',94,1),(1,'00809142',80,1),(1,'00809260',59,0),(1,'00818407',81,1),(1,'00818813',99,1),(1,'00823483',88,1),(1,'00826552',74,0),(1,'00854656',60,0),(1,'00855412',95,1),(1,'00860827',31,0),(1,'00864761',49,0),(1,'00869654',68,0),(2,'00101087',53,0),(2,'00605013',32,0),(2,'00622901',33,0),(2,'00626064',75,0),(2,'00683416',84,1),(2,'00684133',100,1),(2,'00690652',80,1),(2,'00715879',96,1),(2,'00740311',63,0),(2,'00747162',59,0),(2,'00750215',80,1),(2,'00768135',96,1),(2,'00779193',84,1),(2,'00800585',84,1),(2,'00800724',88,1),(2,'00803414',82,1),(2,'00811072',92,1),(2,'00824242',71,0),(2,'00826552',95,1),(2,'00833384',80,1),(2,'00835796',87,1),(2,'00863328',100,1),(2,'00864955',100,1),(2,'00866912',80,1),(2,'00869654',100,1),(3,'00227170',100,1),(3,'00622901',95,1),(3,'00626064',100,1),(3,'00660885',70,0),(3,'00696018',95,1),(3,'00720082',22,0),(3,'00740311',90,1),(3,'00748574',98,1),(3,'00752541',56,0),(3,'00754435',44,0),(3,'00788821',92,1),(3,'00789932',82,1),(3,'00791097',100,1),(3,'00809260',94,1),(3,'00814071',90,1),(3,'00824242',99,1),(3,'00848671',100,1),(3,'00850213',80,1),(3,'00855585',40,0),(3,'00860772',69,0),(3,'00862105',80,1),(3,'00868924',59,0),(3,'00869184',59,0),(3,'00873694',100,1),(4,'00552599',68,0),(4,'00555132',91,1),(4,'00610258',70,0),(4,'00657576',87,1),(4,'00672682',50,0),(4,'00673618',68,0),(4,'00683270',61,0),(4,'00684002',84,1),(4,'00698150',42,0),(4,'00703643',89,1),(4,'00716370',100,1),(4,'00724532',100,1),(4,'00726158',57,0),(4,'00730673',100,1),(4,'00734828',87,1),(4,'00737281',45,0),(4,'00740551',56,0),(4,'00747275',53,0),(4,'00752231',88,1),(4,'00752541',30,0),(4,'00754435',43,0),(4,'00762023',52,0),(4,'00774465',100,1),(4,'00775933',70,0),(4,'00776019',100,1),(4,'00778871',95,1),(4,'00791262',64,0),(4,'00798356',100,1),(4,'00802866',79,1),(4,'00805308',100,1),(4,'00806509',52,0),(4,'00820273',72,0),(4,'00824436',98,1),(4,'00829937',19,0),(4,'00831785',76,1),(4,'00834314',76,1),(4,'00840491',91,1),(4,'00841728',79,1),(4,'00852001',25,0),(4,'00855585',84,1),(4,'00861687',94,1),(4,'00862608',92,1),(4,'00864761',58,0),(4,'00868924',43,0),(4,'00869184',77,1),(4,'00876144',61,0),(4,'00877318',65,0),(4,'00892986',67,0),(5,'00459043',97,1),(5,'00552599',81,1),(5,'00610258',84,1),(5,'00661590',38,0),(5,'00673618',88,1),(5,'00676293',61,0),(5,'00683270',100,1),(5,'00690226',46,0),(5,'00721561',100,1),(5,'00726158',80,1),(5,'00737175',98,1),(5,'00737281',44,0),(5,'00740551',55,0),(5,'00747162',87,1),(5,'00747275',87,1),(5,'00748492',88,1),(5,'00751953',99,1),(5,'00752541',88,1),(5,'00754435',86,1),(5,'00761221',80,1),(5,'00762023',80,1),(5,'00775933',78,0),(5,'00791044',100,1),(5,'00792937',92,1),(5,'00798677',87,1),(5,'00799553',83,1),(5,'00799679',48,0),(5,'00800830',40,0),(5,'00806509',95,1),(5,'00820273',64,0),(5,'00824282',96,1),(5,'00828272',28,0),(5,'00828855',63,0),(5,'00829937',69,0),(5,'00830717',10,0),(5,'00833351',90,1),(5,'00836522',33,0),(5,'00837566',63,0),(5,'00837694',98,1),(5,'00842162',99,1),(5,'00843349',72,0),(5,'00843997',46,0),(5,'00852001',9,0),(5,'00853686',66,0),(5,'00856621',66,0),(5,'00859429',53,0),(5,'00860827',95,1),(5,'00862508',66,0),(5,'00863332',98,1),(5,'00867467',100,1),(5,'00868924',100,1),(5,'00870694',80,1),(5,'00876144',70,0),(5,'00877202',48,0),(5,'00881272',100,1),(5,'00885810',90,1),(5,'00891529',98,1),(5,'00891860',66,0),(5,'00892986',82,1),(6,'00405335',32,0),(6,'00654381',86,1),(6,'00655925',99,1),(6,'00657423',38,0),(6,'00661941',62,0),(6,'00665501',97,1),(6,'00703212',100,1),(6,'00705745',38,0),(6,'00720082',61,0),(6,'00722401',48,0),(6,'00730024',62,0),(6,'00740551',39,0),(6,'00743512',46,0),(6,'00786973',80,1),(6,'00797831',46,0),(6,'00800830',82,1),(6,'00807114',49,0),(6,'00811872',55,0),(6,'00820006',80,1),(6,'00824395',82,1),(6,'00825414',52,0),(6,'00827258',31,0),(6,'00831433',53,0),(6,'00832361',80,1),(6,'00837320',87,1),(6,'00838381',100,1),(6,'00838607',90,1),(6,'00839659',100,1),(6,'00843349',85,1),(6,'00843997',47,0),(6,'00846988',99,1),(6,'00856621',81,1),(6,'00858728',86,1),(6,'00862422',58,0),(6,'00864050',100,1),(6,'00864761',85,1),(6,'00865418',80,1),(6,'00876144',94,1),(6,'00877202',80,1),(6,'00878721',95,1),(6,'00885852',100,1),(6,'00891881',100,1),(6,'00895269',41,0),(6,'00899308',87,1),(6,'00904365',55,0),(6,'00907799',94,1),(6,'00921972',86,1),(7,'00614668',73,0),(7,'00629405',100,1),(7,'00657423',59,0),(7,'00686239',51,0),(7,'00705745',70,0),(7,'00722401',85,1),(7,'00727445',100,1),(7,'00746688',94,1),(7,'00752506',99,1),(7,'00760647',93,1),(7,'00786611',97,1),(7,'00796430',100,1),(7,'00825414',87,1),(7,'00828272',56,0),(7,'00831938',80,1),(7,'00832358',100,1),(7,'00836522',83,1),(7,'00839729',34,0),(7,'00843433',91,1),(7,'00847362',16,0),(7,'00848588',100,1),(7,'00852001',53,0),(7,'00855923',40,0),(7,'00855930',16,0),(7,'00863485',17,0),(7,'00865390',65,0),(7,'00868935',38,0),(7,'00870215',69,0),(7,'00881540',80,1),(7,'00891860',94,1),(7,'00898793',47,0),(8,'00405335',67,0),(8,'00614668',100,1),(8,'00662920',16,0),(8,'00676293',61,0),(8,'00695519',97,1),(8,'00695979',80,1),(8,'00705745',35,0),(8,'00720082',55,0),(8,'00720988',14,0),(8,'00743320',56,0),(8,'00743512',38,0),(8,'00745190',92,1),(8,'00745919',89,1),(8,'00802207',41,0),(8,'00811872',28,0),(8,'00829937',64,0),(8,'00830717',40,0),(8,'00831433',71,0),(8,'00833794',83,1),(8,'00837566',59,0),(8,'00838382',29,0),(8,'00841467',86,1),(8,'00842417',80,1),(8,'00852001',42,0),(8,'00855923',39,0),(8,'00855930',33,0),(8,'00860978',40,0),(8,'00861401',99,1),(8,'00862422',51,0),(8,'00863485',42,0),(8,'00864163',80,1),(8,'00865390',47,0),(8,'00868935',45,0),(8,'00870215',63,0),(8,'00871388',100,1),(8,'00872491',43,0),(8,'00880260',68,0),(8,'00882149',85,1),(8,'00884801',24,0),(8,'00897833',87,1),(8,'00898793',49,0),(8,'00899128',100,1),(8,'00904365',52,0),(8,'00921490',11,0);
/*!40000 ALTER TABLE `exam_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_roster`
--

DROP TABLE IF EXISTS `exam_roster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_roster` (
  `exam_id` int(11) NOT NULL,
  `student_id` varchar(15) NOT NULL,
  `seat_num` int(11) NOT NULL,
  PRIMARY KEY (`exam_id`,`student_id`),
  UNIQUE KEY `exam_id` (`exam_id`,`seat_num`),
  KEY `exam_fkey` (`exam_id`),
  KEY `student_fkey` (`student_id`) USING BTREE,
  CONSTRAINT `exam_roster_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE NO ACTION,
  CONSTRAINT `exam_roster_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_roster`
--

LOCK TABLES `exam_roster` WRITE;
/*!40000 ALTER TABLE `exam_roster` DISABLE KEYS */;
INSERT INTO `exam_roster` VALUES (1,'00869654',1),(1,'00855412',2),(1,'00774443',3),(1,'00788720',4),(1,'00703588',5),(1,'00782838',6),(1,'00809142',7),(1,'00660885',8),(1,'00761221',9),(1,'00798522',10),(1,'00826552',11),(1,'00818407',12),(1,'00864761',13),(1,'00854656',14),(1,'00720081',15),(1,'00101087',16),(1,'00860827',17),(1,'00818813',18),(1,'00665442',19),(1,'00809260',21),(1,'00773500',22),(1,'00497657',23),(1,'00823483',24),(1,'00234980',25),(1,'00762578',49),(2,'00747162',6),(2,'00826552',7),(2,'00626064',8),(2,'00683416',14),(2,'00740311',15),(2,'00869654',17),(2,'00833384',19),(2,'00101087',21),(2,'00866912',23),(2,'00800585',24),(2,'00715879',26),(2,'00835796',29),(2,'00863328',30),(2,'00768135',36),(2,'00684133',38),(2,'00690652',39),(2,'00824242',43),(2,'00803414',47),(2,'00750215',49),(2,'00779193',51),(2,'00605013',55),(2,'00811072',56),(2,'00622901',60),(2,'00864955',62),(2,'00800724',65),(3,'00660885',6),(3,'00809260',7),(3,'00752541',8),(3,'00720082',10),(3,'00868924',20),(3,'00869184',21),(3,'00748574',23),(3,'00855585',24),(3,'00862105',26),(3,'00873694',27),(3,'00626064',28),(3,'00754435',29),(3,'00791097',31),(3,'00227170',35),(3,'00860772',36),(3,'00696018',44),(3,'00788821',48),(3,'00789932',50),(3,'00740311',52),(3,'00814071',53),(3,'00622901',54),(3,'00848671',56),(3,'00850213',59),(3,'00824242',62),(4,'00869184',1),(4,'00841728',2),(4,'00754435',3),(4,'00862608',4),(4,'00791262',5),(4,'00868924',7),(4,'00798356',8),(4,'00824436',10),(4,'00877318',11),(4,'00806509',12),(4,'00864761',13),(4,'00820273',14),(4,'00726158',15),(4,'00861687',17),(4,'00683270',18),(4,'00730673',19),(4,'00734828',21),(4,'00776019',22),(4,'00762023',24),(4,'00774465',25),(4,'00778871',26),(4,'00892986',28),(4,'00802866',29),(4,'00840491',30),(4,'00610258',31),(4,'00657576',32),(4,'00672682',34),(4,'00673618',36),(4,'00852001',37),(4,'00740551',40),(4,'00747275',41),(4,'00716370',42),(4,'00684002',43),(4,'00555132',46),(4,'00831785',50),(4,'00703643',52),(4,'00737281',53),(4,'00752541',54),(4,'00855585',55),(4,'00829937',56),(4,'00752231',57),(4,'00724532',58),(4,'00834314',60),(4,'00805308',61),(4,'00876144',63),(4,'00698150',64),(4,'00775933',65),(4,'00552599',66),(5,'00552599',1),(5,'00661590',2),(5,'00828272',4),(5,'00842162',5),(5,'00881272',6),(5,'00775933',7),(5,'00830717',8),(5,'00843997',9),(5,'00762023',10),(5,'00891860',11),(5,'00800830',12),(5,'00747162',13),(5,'00836522',14),(5,'00867467',15),(5,'00863332',16),(5,'00798677',17),(5,'00747275',19),(5,'00721561',20),(5,'00824282',21),(5,'00891529',22),(5,'00726158',23),(5,'00892986',24),(5,'00673618',25),(5,'00837566',26),(5,'00852001',27),(5,'00610258',28),(5,'00856621',29),(5,'00833351',30),(5,'00676293',31),(5,'00876144',32),(5,'00820273',33),(5,'00459043',34),(5,'00828855',35),(5,'00690226',36),(5,'00829937',37),(5,'00843349',38),(5,'00877202',39),(5,'00837694',40),(5,'00752541',41),(5,'00754435',42),(5,'00683270',43),(5,'00870694',45),(5,'00792937',46),(5,'00853686',47),(5,'00799553',48),(5,'00885810',49),(5,'00751953',51),(5,'00761221',52),(5,'00799679',53),(5,'00740551',54),(5,'00868924',57),(5,'00737175',58),(5,'00862508',59),(5,'00859429',60),(5,'00806509',61),(5,'00791044',63),(5,'00748492',64),(5,'00860827',65),(5,'00737281',66),(6,'00797831',1),(6,'00921972',2),(6,'00743512',3),(6,'00877202',4),(6,'00878721',5),(6,'00827258',6),(6,'00843349',8),(6,'00843997',9),(6,'00864050',11),(6,'00846988',12),(6,'00839659',13),(6,'00786973',14),(6,'00824395',16),(6,'00838381',17),(6,'00876144',18),(6,'00705745',20),(6,'00800830',21),(6,'00885852',23),(6,'00820006',24),(6,'00856621',26),(6,'00740551',27),(6,'00807114',28),(6,'00862422',31),(6,'00895269',33),(6,'00722401',35),(6,'00907799',37),(6,'00657423',38),(6,'00904365',39),(6,'00891881',40),(6,'00864761',41),(6,'00720082',42),(6,'00665501',43),(6,'00825414',45),(6,'00654381',47),(6,'00865418',49),(6,'00858728',50),(6,'00405335',51),(6,'00811872',52),(6,'00899308',53),(6,'00661941',57),(6,'00831433',58),(6,'00703212',59),(6,'00730024',60),(6,'00837320',61),(6,'00832361',64),(6,'00838607',65),(6,'00655925',66),(7,'00881540',1),(7,'00863485',2),(7,'00746688',10),(7,'00752506',11),(7,'00855930',12),(7,'00836522',16),(7,'00614668',18),(7,'00898793',23),(7,'00870215',24),(7,'00686239',26),(7,'00786611',27),(7,'00831938',28),(7,'00868935',29),(7,'00727445',33),(7,'00843433',34),(7,'00796430',36),(7,'00848588',37),(7,'00760647',39),(7,'00705745',41),(7,'00847362',42),(7,'00629405',43),(7,'00891860',48),(7,'00832358',49),(7,'00657423',51),(7,'00865390',52),(7,'00828272',54),(7,'00852001',56),(7,'00855923',59),(7,'00839729',61),(7,'00722401',62),(7,'00825414',65),(8,'00865390',1),(8,'00871388',2),(8,'00897833',3),(8,'00880260',4),(8,'00614668',5),(8,'00833794',6),(8,'00837566',7),(8,'00861401',8),(8,'00852001',10),(8,'00720988',11),(8,'00855923',12),(8,'00899128',13),(8,'00870215',14),(8,'00868935',16),(8,'00811872',17),(8,'00855930',19),(8,'00745919',20),(8,'00898793',21),(8,'00862422',22),(8,'00405335',23),(8,'00872491',25),(8,'00841467',28),(8,'00884801',29),(8,'00921490',32),(8,'00676293',34),(8,'00904365',35),(8,'00863485',38),(8,'00882149',40),(8,'00743512',41),(8,'00864163',42),(8,'00695519',44),(8,'00802207',46),(8,'00830717',47),(8,'00720082',51),(8,'00743320',53),(8,'00695979',54),(8,'00829937',55),(8,'00860978',56),(8,'00705745',59),(8,'00842417',60),(8,'00662920',62),(8,'00838382',64),(8,'00745190',65),(8,'00831433',66),(9,'00101087',23),(9,'00743320',64);
/*!40000 ALTER TABLE `exam_roster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `faculty_id` varchar(15) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`faculty_id`,`type`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('000','000'),('00046759','Admin'),('00046759','Grader'),('00046759','Teacher'),('00110458','Admin'),('00110458','Grader'),('00110458','Teacher'),('999999','System');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homepage_content`
--

DROP TABLE IF EXISTS `homepage_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homepage_content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `html_content` text,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homepage_content`
--

LOCK TABLES `homepage_content` WRITE;
/*!40000 ALTER TABLE `homepage_content` DISABLE KEYS */;
INSERT INTO `homepage_content` VALUES (1,'Exam Environment','&lt;p&gt;&lt;b&gt;&lt;u&gt;&lt;span style=&quot;font-size: 18px;&quot;&gt;Winter 2020 APE registration is now open&lt;/span&gt;&lt;/u&gt;!&amp;nbsp; It is being held in rooms 207 and 208 of the CEB. Direct any problems you have to Tom Capaul at &lt;a href=&quot;mailto:tcapaul@ewu.edu&quot;&gt;tcapaul@ewu.edu&lt;/a&gt;&lt;/b&gt;&lt;/p&gt;&lt;hr&gt;&lt;p&gt;Windows Operating System&lt;/p&gt;&lt;p&gt;Editors&lt;/p&gt;&lt;ul&gt;&lt;li&gt;JGrasp&lt;/li&gt;&lt;li&gt;Eclipse&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;JDK 8.0 (1.8.x)&lt;/p&gt;&lt;p&gt;Java API Documentation&lt;/p&gt;&lt;p&gt;No Internet access allowed&lt;/p&gt;&lt;p&gt;No notes or texts allowed&lt;/p&gt;&lt;p&gt;The exam is now a Test Driven Design Exam where you are writing code based on the provided tests&lt;br&gt;&lt;/p&gt;'),(2,'Exam Specifics','&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;The Computer Science Department has determined that the distribution of points within the exam will be as follows:&lt;/span&gt;&lt;/p&gt;&lt;hr&gt;&lt;p&gt;&lt;b&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;General Program Design: 30%&lt;/span&gt;&lt;/b&gt;&lt;br&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Penalty points can be assessed in this category for grossly inefficient code&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Text file input and output&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Exception handling associated with files&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Order-related manipulations -- you will need to write a sort routine without making calls to any Java API sort methods. &amp;nbsp;You may be asked to write a sort on an Array, ArrayList, or Linked List.&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;hr&gt;&lt;p&gt;&lt;b&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Data Abstraction and Class Design: 30%&lt;/span&gt;&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Extending a class&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Overriding a method, such as&lt;/span&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;strong&gt;&lt;em style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;toString&lt;/span&gt;&lt;/em&gt;&lt;/strong&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Creating a class (could be as a super class, an abstract super class, or a sub class)&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Accessing super class methods and/or fields&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Implementing an interface, such as&lt;/span&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;strong&gt;&lt;em style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Comparable, Comparator, Iterator, or an exam specific interface&lt;/span&gt;&lt;/em&gt;&lt;/strong&gt;&lt;/li&gt;&lt;/ul&gt;&lt;hr&gt;&lt;p&gt;&lt;b&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Linked List Manipulation: 20%&lt;/span&gt;&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;This will be a non-circular singly-linked list. &amp;nbsp;Some operations will be on a list with&amp;nbsp;a dummy/header/buffer/sentinel node. &amp;nbsp;Some operations will be on a list without such a node.&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Operations will be&lt;/span&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;strong&gt;&lt;em style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;chosen&lt;/span&gt;&lt;/em&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;from the following list.&lt;/span&gt;&lt;ul style=&quot;margin-right: 0px; margin-left: 0px; padding: 0px 0px 1em 1em; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Adding a node(s) — all cases (to an empty list, to a non-empty list, at front, at back, in the middle)&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Remove a node(s) — all cases (based on index, based on Object equality, from front, from back, from middle)&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Retrieve an item based on index or some other criterion (such as maximum or minimum).&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Order-related manipulations, such as addOrdered and sort, may be exemplified within the linked list.&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Generate a sublist, based on some criterion or criteria.&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;hr&gt;&lt;p&gt;&lt;b&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Recursion: 20%&lt;/span&gt;&lt;/b&gt;&lt;br&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Simple recursive methods to accomplish a task, which may or may not be list related. Examples would be printing a linked list in reverse, computation of factorials, and other recursive algorithms at the level of those covered in Programming Principles I and II and in Data Structures.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;An example you probably haven\'t seen: &lt;/span&gt;&lt;a href=&quot;http://penguin.ewu.edu/cscd300/Topic/Recursion/AdditiveSquares.java&quot; target=&quot;_blank&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;AdditiveSquares.java&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;hr&gt;&lt;p&gt;&lt;b&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;EXPANDED SPECIFICS&lt;/span&gt;&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;An expanded list of topics follows.&amp;nbsp; You should make sure you are proficient in each area to ensure success.&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Linked list utilization (a subset of the below items will be required)&lt;/span&gt;&lt;/li&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;insert (front, back, in order)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;delete (front, back, specific item)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;print&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;traverse&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;sort(you must write the code, unless otherwise specified)&amp;nbsp; Note, however, that you may be asked to do array-oriented sorting.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;build a sub-list from an existing list&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;utilize a dummy head node or not utilize one&lt;br&gt;&lt;br&gt;&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;li&gt;Basic recursion (like using recursion to traverse a linked list in some form, or print the contents of a linked list in reverse order)&lt;br&gt;&lt;br&gt;&lt;/li&gt;&lt;ul&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;File input and output&lt;/span&gt;&lt;ul style=&quot;margin-right: 0px; margin-left: 0px; padding: 0px 0px 1em 1em; border: 0px; font-size: 14.6667px; font-family: Verdana, Arial, Helvetica, sans-serif; vertical-align: baseline;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Input via a Scanner object&lt;/span&gt;&lt;ul style=&quot;margin-right: 0px; margin-left: 0px; padding: 0px 0px 1em 1em; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;any input file will be well formed&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to stop when end of file is reached&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;remember to close file when finished&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to utilize your Scanner object to&amp;nbsp;check for specific kinds of data (e.g. hasNextDouble()) before reading the data (e.g. nextDouble())&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to deal with different exceptions that can occur when opening an input file&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Output via PrintWriter/PrintStream&lt;/span&gt;&lt;ul style=&quot;margin-right: 0px; margin-left: 0px; padding: 0px 0px 1em 1em; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to format output (decimal points, columns, etc.)&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;remember to close output file when finished&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to deal with different exceptions that can occur when opening an output file&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/ul&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Inheritance&lt;/span&gt;&lt;ul style=&quot;margin-right: 0px; margin-left: 0px; padding: 0px 0px 1em 1em; border: 0px; font-size: 14.6667px; font-family: Verdana, Arial, Helvetica, sans-serif; vertical-align: baseline;&quot;&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Understand super / sub class relationship&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to override methods to enable polymorphic behavior&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;understand abstract classes and interfaces&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to create a sub class from super class&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to call base/parent/super class methods (requires use of keyword super)&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;understand visibility (private versus protected in a super class)&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to call super class constructor (requires use of the keyword super)&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;br&gt;&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Comparable interface&lt;/span&gt;&lt;/li&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to implement for a given class, including multiple-key comparisons&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to utilize when searching and sorting (i.e. call the compareTo method)&lt;/span&gt;&lt;br&gt;&lt;br&gt;&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Basic exception handling&lt;/span&gt;&lt;/li&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to designate a section of code as possibly throwing an execption (via a try block)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to handle and exception (via a catch block)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to propagate an exception from a method (by using throws and the end of the method signature)&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to generically handle an exception (use Exception to do this)&lt;br&gt;&lt;br&gt;&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;toString&lt;/span&gt;&lt;/li&gt;&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to implement properly for a given class&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;know how to utilize an existing toString provided by a class (recall that it returns a String representing data in the object you\'d like printed and that it is automatically invoked whenever you try and print an object using print, println, or printf with the &quot;%s&quot; format specifier)&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;This exam covers material very similar to that in the warm-up assignment in Data Structures (CSCD300), or possibly the warm-up assignment and the second programming assignment.&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px;&quot;&gt;All mat&lt;span style=&quot;font-size: 14px;&quot;&gt;erial on the exam is introduced in either CSCD 210 (Programming Principles I) or CSCD 211 (Programming Principles II).&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;You will not have to start&lt;/span&gt; from scratch on the exam.&amp;nbsp; You will be given a (previously) working program that has had functionality removed.&amp;nbsp; It is your job to reinsert that functionality.&amp;nbsp; For the most part, this will be done via adding methods.&amp;nbsp; You will be told in some way what methods are required.&amp;nbsp; You may be asked to write a class in its entirety.&amp;nbsp; However, if you are asked to write an entire class the amount of code you will be required to write is not intended to be “large.”&amp;nbsp; Questions will be asked in “parts” that can be done separately.&amp;nbsp; This means if you mess up on part 1, and part 2 requires something from part 1, you will not need to have completed part 1 successfully to do part 2.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;'),(3,'Problem Areas Identified From Previous Exams','&lt;ul&gt;&lt;li&gt;Not following directions&lt;/li&gt;&lt;li&gt;Not reading the specifications in their entirety â€” make sure you read all directions before you begin writing code.&amp;nbsp; A prime example is ignoring specifications related to whether the linked list does or does not have a header/sentinel node.&lt;/li&gt;&lt;li&gt;Not placing files in specified location&lt;/li&gt;&lt;li&gt;Not naming files as specified&lt;/li&gt;&lt;li&gt;Modifying files that were to be left alone&lt;/li&gt;&lt;li&gt;Unfamiliarity with keywords in Java required for basic things like inheritance (extends) and interface use (implements)&lt;/li&gt;&lt;li&gt;Spending too much time on one item&lt;/li&gt;&lt;li&gt;Inability to implement simple recursion&lt;/li&gt;&lt;/ul&gt;'),(4,'Basic Strategies You Should Use','&lt;ul&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Stub the methods out that you have to write, then fill them in with useful code when you are ready&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Read the directions carefully, then look at the sample input and output before you begin writing code&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Comment out items that don\'t compile so you can test other parts of your solution (this includes methods you can\'t get to work and method calls that may occur from elsewhere&amp;nbsp; like in the main method of the program).&amp;nbsp; Note, however, that your code will be tested using the original driver file, not your edited one.&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 14.6667px; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;For linked lists, make sure you can write any of the fundamental methods that the Java API LinkedList class contains.&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;'),(5,'Practice Exams','&lt;p&gt;&lt;/p&gt;&lt;ul&gt;\n&lt;li&gt;&lt;a href=&quot;http://penguin.ewu.edu/advancement_exam/practice_exams/W11APE.zip&quot;&gt;Winter 2011 Student Version&lt;/a&gt;&lt;/li&gt;\n&lt;li&gt;&lt;a title=&quot;Sample APE Solution&quot; href=&quot;http://penguin.ewu.edu/advancement_exam/practice_exams/W11FullAPE.zip&quot;&gt;Winter 2011 Solution&lt;/a&gt;&lt;/li&gt;\n&lt;li&gt;&lt;a href=&quot;http://penguin.ewu.edu/advancement_exam/practice_exams/W12APE.zip&quot;&gt;Winter 2012 Student Version&lt;/a&gt;&lt;/li&gt;\n&lt;li&gt;&lt;a title=&quot;Summer 2013 Student APE&quot; href=&quot;http://penguin.ewu.edu/advancement_exam/practice_exams/Summer2013APE.zip&quot; target=&quot;_blank&quot;&gt;Summer 2013 Student Version&lt;/a&gt;&lt;/li&gt;\n&lt;li&gt;Summer 2017 APE: Includes Eclipse project with unit tests&lt;/li&gt;\n&lt;ul&gt;\n&lt;li&gt;&lt;a href=&quot;http://penguin.ewu.edu/advancement_exam/practice_exams/Summer2017APE.zip&quot;&gt;Student Version&lt;/a&gt;&lt;/li&gt;\n&lt;li&gt;&lt;a href=&quot;http://penguin.ewu.edu/advancement_exam/practice_exams/Summer2017APESolution.zip&quot;&gt;Solution&lt;/a&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px;&quot;&gt;NOTE: These are&amp;nbsp;sample exams — do not expect the exam you take to be formatted in precisely the same way, with the same number of classes, methods, etc. — this is just for practice and to give you an idea of what to expect.&amp;nbsp; The amount of code you are asked to write on these exams is similar to the amount you will have to write on the actual exam.&amp;nbsp; The topics on these exams are a selection from the list given at the top of this web page; the actual exam you take may have topics not addressed on this exam, but which are a part of the list above.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;'),(6,'NOTES','&lt;ul&gt;&lt;li&gt;&lt;b style=&quot;color: rgb(206, 0, 0);&quot;&gt;Any student requesting accomodations based on DSS, must send an email to tcapaul@ewu.edu at least one week prior to the exam.&lt;/b&gt;&lt;/li&gt;&lt;li&gt;You are allowed to take the APE only three (3) times without passing.&lt;/li&gt;&lt;li&gt;It is your responsibility to register for the exam online. If you show up to the exam without registering, you may be turned away&lt;/li&gt;&lt;li&gt;Online registration is done through this page.&lt;/li&gt;&lt;li&gt;Bring your student ID with you to the exam&lt;/li&gt;&lt;/ul&gt;');
/*!40000 ALTER TABLE `homepage_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `in_class_exam`
--

DROP TABLE IF EXISTS `in_class_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `in_class_exam` (
  `exam_id` int(11) NOT NULL,
  `teacher_id` varchar(15) NOT NULL,
  PRIMARY KEY (`exam_id`,`teacher_id`),
  KEY `exam_fkey` (`exam_id`),
  KEY `teacher_fkey` (`teacher_id`),
  CONSTRAINT `exam_fkey` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE CASCADE,
  CONSTRAINT `teacher_fkey` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in_class_exam`
--

LOCK TABLES `in_class_exam` WRITE;
/*!40000 ALTER TABLE `in_class_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `in_class_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `in_class_student`
--

DROP TABLE IF EXISTS `in_class_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `in_class_student` (
  `student_id` varchar(15) NOT NULL,
  `teacher_id` varchar(15) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  UNIQUE KEY `student_id` (`student_id`,`teacher_id`,`start_date`,`end_date`),
  KEY `teacher_id_fkey` (`teacher_id`),
  CONSTRAINT `student_id_fkey` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `teacher_id_fkey` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `in_class_student`
--

LOCK TABLES `in_class_student` WRITE;
/*!40000 ALTER TABLE `in_class_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `in_class_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `loc_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `seats` int(11) NOT NULL,
  PRIMARY KEY (`loc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'CEB 208',34),(2,'CEB 207',32),(3,'CEB 230',22),(4,'CEB 207 and 208',66),(5,'CEB 207, 208, 230',88);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` varchar(15) NOT NULL,
  `state` varchar(15) NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `edited_by` varchar(15) NOT NULL DEFAULT '999999',
  PRIMARY KEY (`student_id`),
  KEY `student_ibfk_2` (`edited_by`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`edited_by`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('00101087','Registered',NULL,'999999'),('00132105','Ready',NULL,'999999'),('00227170','Passed',NULL,'999999'),('00234980','Passed',NULL,'999999'),('00405335','Ready',NULL,'999999'),('00459043','Passed',NULL,'999999'),('00497657','Passed',NULL,'999999'),('00519357','Ready',NULL,'999999'),('00552599','Passed',NULL,'999999'),('00555132','Passed',NULL,'999999'),('00605013','Ready',NULL,'999999'),('00610258','Passed',NULL,'999999'),('00614668','Passed',NULL,'999999'),('00615459','Ready',NULL,'999999'),('00622901','Passed',NULL,'999999'),('00623077','Ready',NULL,'999999'),('00626064','Passed',NULL,'999999'),('00629405','Passed',NULL,'999999'),('00654381','Passed',NULL,'999999'),('00655925','Passed',NULL,'999999'),('00657423','Ready',NULL,'999999'),('00657576','Passed',NULL,'999999'),('00658719','Ready',NULL,'999999'),('00660885','Ready',NULL,'999999'),('00661590','Ready',NULL,'999999'),('00661941','Ready',NULL,'999999'),('00662920','Ready',NULL,'999999'),('00665442','Passed',NULL,'999999'),('00665501','Passed',NULL,'999999'),('00672682','Ready',NULL,'999999'),('00673618','Passed',NULL,'999999'),('00676293','Ready',NULL,'999999'),('00683270','Passed',NULL,'999999'),('00683416','Passed',NULL,'999999'),('00684002','Passed',NULL,'999999'),('00684133','Passed',NULL,'999999'),('00686239','Ready',NULL,'999999'),('00690226','Ready',NULL,'999999'),('00690652','Passed',NULL,'999999'),('00695519','Passed',NULL,'999999'),('00695979','Passed',NULL,'999999'),('00696018','Passed',NULL,'999999'),('00697147','Ready',NULL,'999999'),('00698150','Ready',NULL,'999999'),('00699739','Ready',NULL,'999999'),('00703212','Passed',NULL,'999999'),('00703588','Passed',NULL,'999999'),('00703643','Passed',NULL,'999999'),('00705745','Blocked',NULL,'999999'),('00715879','Passed',NULL,'999999'),('00716370','Passed',NULL,'999999'),('00720081','Passed',NULL,'999999'),('00720082','Blocked',NULL,'999999'),('00720988','Ready',NULL,'999999'),('00721561','Passed',NULL,'999999'),('00722401','Passed',NULL,'999999'),('00724532','Passed',NULL,'999999'),('00726158','Passed',NULL,'999999'),('00727445','Passed',NULL,'999999'),('00728052','Ready',NULL,'999999'),('00729221','Ready',NULL,'999999'),('00730024','Ready',NULL,'999999'),('00730673','Passed',NULL,'999999'),('00732729','Ready',NULL,'999999'),('00734828','Passed',NULL,'999999'),('00737175','Passed',NULL,'999999'),('00737281','Ready',NULL,'999999'),('00740311','Passed',NULL,'999999'),('00740551','Blocked',NULL,'999999'),('00743320','Registered',NULL,'999999'),('00743512','Ready',NULL,'999999'),('00745190','Passed',NULL,'999999'),('00745919','Passed',NULL,'999999'),('00746427','Ready',NULL,'999999'),('00746688','Passed',NULL,'999999'),('00747069','Ready',NULL,'999999'),('00747162','Passed',NULL,'999999'),('00747275','Passed',NULL,'999999'),('00748492','Passed',NULL,'999999'),('00748574','Passed',NULL,'999999'),('00750215','Passed',NULL,'999999'),('00751953','Passed',NULL,'999999'),('00752231','Passed',NULL,'999999'),('00752506','Passed',NULL,'999999'),('00752541','Passed',NULL,'999999'),('00754435','Passed',NULL,'999999'),('00758161','Ready',NULL,'999999'),('00760647','Passed',NULL,'999999'),('00761221','Passed',NULL,'999999'),('00762023','Passed',NULL,'999999'),('00762578','Passed',NULL,'999999'),('00768135','Passed',NULL,'999999'),('00773500','Passed',NULL,'999999'),('00774443','Passed',NULL,'999999'),('00774465','Passed',NULL,'999999'),('00775933','Ready',NULL,'999999'),('00776019','Passed',NULL,'999999'),('00778871','Passed',NULL,'999999'),('00779193','Passed',NULL,'999999'),('00782838','Passed',NULL,'999999'),('00786611','Passed',NULL,'999999'),('00786973','Passed',NULL,'999999'),('00788655','Ready',NULL,'999999'),('00788720','Passed',NULL,'999999'),('00788821','Passed',NULL,'999999'),('00789932','Passed',NULL,'999999'),('00791044','Passed',NULL,'999999'),('00791097','Passed',NULL,'999999'),('00791262','Ready',NULL,'999999'),('00791561','Ready',NULL,'999999'),('00792937','Passed',NULL,'999999'),('00796430','Passed',NULL,'999999'),('00797831','Ready',NULL,'999999'),('00798356','Passed',NULL,'999999'),('00798522','Passed',NULL,'999999'),('00798677','Passed',NULL,'999999'),('00799553','Passed',NULL,'999999'),('00799679','Ready',NULL,'999999'),('00800585','Passed',NULL,'999999'),('00800724','Passed',NULL,'999999'),('00800830','Passed',NULL,'999999'),('00802207','Ready',NULL,'999999'),('00802866','Passed',NULL,'999999'),('00803414','Passed',NULL,'999999'),('00805308','Passed',NULL,'999999'),('00805653','Ready',NULL,'999999'),('00806509','Passed',NULL,'999999'),('00807114','Ready',NULL,'999999'),('00809142','Passed',NULL,'999999'),('00809183','Ready',NULL,'999999'),('00809260','Passed',NULL,'999999'),('00811072','Passed',NULL,'999999'),('00811872','Ready',NULL,'999999'),('00814071','Passed',NULL,'999999'),('00818407','Passed',NULL,'999999'),('00818721','Ready',NULL,'999999'),('00818813','Passed',NULL,'999999'),('00820006','Passed',NULL,'999999'),('00820273','Ready',NULL,'999999'),('00823483','Passed',NULL,'999999'),('00824242','Passed',NULL,'999999'),('00824282','Passed',NULL,'999999'),('00824395','Passed',NULL,'999999'),('00824436','Passed',NULL,'999999'),('00825414','Passed',NULL,'999999'),('00826552','Passed',NULL,'999999'),('00827258','Ready',NULL,'999999'),('00827750','Ready',NULL,'999999'),('00828252','Ready',NULL,'999999'),('00828272','Ready',NULL,'999999'),('00828855','Ready',NULL,'999999'),('00829735','Ready',NULL,'999999'),('00829937','Blocked',NULL,'999999'),('00830717','Ready',NULL,'999999'),('00831433','Ready',NULL,'999999'),('00831785','Passed',NULL,'999999'),('00831938','Passed',NULL,'999999'),('00832358','Passed',NULL,'999999'),('00832361','Passed',NULL,'999999'),('00833351','Passed',NULL,'999999'),('00833384','Passed',NULL,'999999'),('00833794','Passed',NULL,'999999'),('00834314','Passed',NULL,'999999'),('00835796','Passed',NULL,'999999'),('00836522','Passed',NULL,'999999'),('00837320','Passed',NULL,'999999'),('00837566','Ready',NULL,'999999'),('00837694','Passed',NULL,'999999'),('00838381','Passed',NULL,'999999'),('00838382','Ready',NULL,'999999'),('00838607','Passed',NULL,'999999'),('00839659','Passed',NULL,'999999'),('00839729','Ready',NULL,'999999'),('00840491','Passed',NULL,'999999'),('00841467','Passed',NULL,'999999'),('00841728','Passed',NULL,'999999'),('00842107','Ready',NULL,'999999'),('00842162','Passed',NULL,'999999'),('00842417','Passed',NULL,'999999'),('00843349','Passed',NULL,'999999'),('00843433','Passed',NULL,'999999'),('00843997','Ready',NULL,'999999'),('00846988','Passed',NULL,'999999'),('00847362','Ready',NULL,'999999'),('00848588','Passed',NULL,'999999'),('00848671','Passed',NULL,'999999'),('00850213','Passed',NULL,'999999'),('00852001','Blocked','granted one more try','00110458'),('00853686','Ready',NULL,'999999'),('00854656','Ready',NULL,'999999'),('00855412','Passed',NULL,'999999'),('00855585','Passed','registered by tom','00110458'),('00855923','Ready',NULL,'999999'),('00855930','Ready',NULL,'999999'),('00856621','Passed',NULL,'999999'),('00857780','Ready',NULL,'999999'),('00858728','Passed',NULL,'999999'),('00859429','Ready',NULL,'999999'),('00860772','Ready',NULL,'999999'),('00860827','Passed',NULL,'999999'),('00860978','Ready',NULL,'999999'),('00861401','Passed',NULL,'999999'),('00861687','Passed',NULL,'999999'),('00861805','Ready',NULL,'999999'),('00862105','Passed',NULL,'999999'),('00862422','Ready',NULL,'999999'),('00862508','Ready',NULL,'999999'),('00862608','Passed',NULL,'999999'),('00863328','Passed',NULL,'999999'),('00863332','Passed',NULL,'999999'),('00863485','Ready',NULL,'999999'),('00864050','Passed',NULL,'999999'),('00864163','Passed',NULL,'999999'),('00864761','Passed',NULL,'999999'),('00864955','Passed',NULL,'999999'),('00865390','Ready',NULL,'999999'),('00865418','Passed',NULL,'999999'),('00866912','Passed',NULL,'999999'),('00867467','Passed',NULL,'999999'),('00868231','Ready',NULL,'999999'),('00868563','Ready',NULL,'999999'),('00868824','Ready',NULL,'999999'),('00868924','Passed',NULL,'999999'),('00868935','Ready',NULL,'999999'),('00869184','Passed',NULL,'999999'),('00869654','Passed',NULL,'999999'),('00870215','Ready',NULL,'999999'),('00870694','Passed',NULL,'999999'),('00871388','Passed',NULL,'999999'),('00872491','Ready',NULL,'999999'),('00873694','Passed',NULL,'999999'),('00876021','Ready',NULL,'999999'),('00876144','Passed',NULL,'999999'),('00877202','Passed',NULL,'999999'),('00877318','Ready',NULL,'999999'),('00878721','Passed',NULL,'999999'),('00880260','Ready',NULL,'999999'),('00881272','Passed',NULL,'999999'),('00881540','Passed',NULL,'999999'),('00882149','Passed',NULL,'999999'),('00884801','Ready',NULL,'999999'),('00885810','Passed',NULL,'999999'),('00885852','Passed',NULL,'999999'),('00889472','Ready',NULL,'999999'),('00891529','Passed',NULL,'999999'),('00891860','Passed',NULL,'999999'),('00891881','Passed',NULL,'999999'),('00892986','Passed',NULL,'999999'),('00895269','Ready',NULL,'999999'),('00897833','Passed',NULL,'999999'),('00898793','Ready',NULL,'999999'),('00899128','Passed',NULL,'999999'),('00899308','Passed',NULL,'999999'),('00902943','Ready',NULL,'999999'),('00904365','Ready',NULL,'999999'),('00907799','Passed',NULL,'999999'),('00913217','Ready',NULL,'999999'),('00921419','Ready',NULL,'999999'),('00921490','Ready',NULL,'999999'),('00921972','Passed',NULL,'999999');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_cat_grade`
--

DROP TABLE IF EXISTS `student_cat_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_cat_grade` (
  `student_id` varchar(15) NOT NULL,
  `exam_cat_id` int(11) NOT NULL,
  `final_grade` int(11) NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `edited_by` varchar(15) NOT NULL,
  PRIMARY KEY (`student_id`,`exam_cat_id`),
  KEY `exam_cat_id_fkey` (`exam_cat_id`),
  KEY `edited_by_fk` (`edited_by`),
  CONSTRAINT `edited_by_fk` FOREIGN KEY (`edited_by`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `exam_cat_id_fkey` FOREIGN KEY (`exam_cat_id`) REFERENCES `exam_category` (`exam_cat_id`) ON UPDATE CASCADE,
  CONSTRAINT `student_cat_grade_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_cat_grade`
--

LOCK TABLES `student_cat_grade` WRITE;
/*!40000 ALTER TABLE `student_cat_grade` DISABLE KEYS */;
INSERT INTO `student_cat_grade` VALUES ('00101087',5,7,'wrong value entered','00110458'),('00101087',6,25,NULL,'999999'),('00101087',7,14,NULL,'999999'),('00101087',8,7,NULL,'999999'),('00101087',9,10,NULL,'999999'),('00101087',10,26,NULL,'999999'),('00101087',11,10,NULL,'999999'),('00101087',12,7,NULL,'999999'),('00227170',13,30,NULL,'00110458'),('00227170',14,30,NULL,'00110458'),('00227170',15,20,NULL,'00110458'),('00227170',16,20,NULL,'00110458'),('00234980',5,16,NULL,'999999'),('00234980',6,30,NULL,'999999'),('00234980',7,27,NULL,'999999'),('00234980',8,18,'wrong value','00110458'),('00405335',25,11,NULL,'00110458'),('00405335',26,4,NULL,'00110458'),('00405335',27,7,NULL,'00110458'),('00405335',28,10,NULL,'00110458'),('00405335',33,15,NULL,'999999'),('00405335',34,30,NULL,'999999'),('00405335',35,3,NULL,'999999'),('00405335',36,19,NULL,'999999'),('00459043',21,20,NULL,'00110458'),('00459043',22,29,NULL,'00110458'),('00459043',23,20,NULL,'00110458'),('00459043',24,28,NULL,'00110458'),('00497657',5,20,NULL,'999999'),('00497657',6,25,NULL,'999999'),('00497657',7,30,NULL,'999999'),('00497657',8,20,NULL,'999999'),('00552599',17,11,NULL,'00110458'),('00552599',18,24,NULL,'00110458'),('00552599',19,6,NULL,'00110458'),('00552599',20,27,NULL,'00110458'),('00552599',21,12,NULL,'00110458'),('00552599',22,29,NULL,'00110458'),('00552599',23,10,NULL,'00110458'),('00552599',24,30,NULL,'00110458'),('00555132',17,14,NULL,'00110458'),('00555132',18,30,NULL,'00110458'),('00555132',19,17,NULL,'00110458'),('00555132',20,30,NULL,'00110458'),('00605013',9,4,NULL,'999999'),('00605013',10,9,NULL,'999999'),('00605013',11,0,NULL,'999999'),('00605013',12,19,NULL,'999999'),('00610258',17,16,NULL,'00110458'),('00610258',18,10,NULL,'00110458'),('00610258',19,19,NULL,'00110458'),('00610258',20,25,NULL,'00110458'),('00610258',21,20,NULL,'00110458'),('00610258',22,20,NULL,'00110458'),('00610258',23,16,NULL,'00110458'),('00610258',24,28,NULL,'00110458'),('00614668',29,17,NULL,'00110458'),('00614668',30,7,NULL,'00110458'),('00614668',31,30,NULL,'00110458'),('00614668',32,19,NULL,'00110458'),('00614668',33,20,NULL,'999999'),('00614668',34,30,NULL,'999999'),('00614668',35,30,NULL,'999999'),('00614668',36,20,NULL,'999999'),('00622901',9,20,NULL,'999999'),('00622901',10,4,NULL,'999999'),('00622901',11,0,NULL,'999999'),('00622901',12,9,NULL,'999999'),('00622901',13,28,NULL,'00110458'),('00622901',14,27,NULL,'00110458'),('00622901',15,20,NULL,'00110458'),('00622901',16,20,NULL,'00110458'),('00626064',9,10,NULL,'999999'),('00626064',10,30,NULL,'999999'),('00626064',11,10,NULL,'999999'),('00626064',12,25,NULL,'999999'),('00626064',13,30,NULL,'00110458'),('00626064',14,30,NULL,'00110458'),('00626064',15,20,NULL,'00110458'),('00626064',16,20,NULL,'00110458'),('00629405',29,20,NULL,'00110458'),('00629405',30,30,NULL,'00110458'),('00629405',31,30,NULL,'00110458'),('00629405',32,20,NULL,'00110458'),('00654381',25,24,NULL,'00110458'),('00654381',26,15,NULL,'00110458'),('00654381',27,29,NULL,'00110458'),('00654381',28,18,NULL,'00110458'),('00655925',25,30,NULL,'00110458'),('00655925',26,20,NULL,'00110458'),('00655925',27,29,NULL,'00110458'),('00655925',28,20,NULL,'00110458'),('00657423',25,17,NULL,'00110458'),('00657423',26,6,NULL,'00110458'),('00657423',27,8,NULL,'00110458'),('00657423',28,7,NULL,'00110458'),('00657423',29,6,NULL,'00110458'),('00657423',30,25,NULL,'00110458'),('00657423',31,18,NULL,'00110458'),('00657423',32,10,NULL,'00110458'),('00657576',17,14,NULL,'00110458'),('00657576',18,26,NULL,'00110458'),('00657576',19,18,NULL,'00110458'),('00657576',20,29,NULL,'00110458'),('00660885',5,11,NULL,'999999'),('00660885',6,17,NULL,'999999'),('00660885',7,20,NULL,'999999'),('00660885',8,8,NULL,'999999'),('00660885',13,18,NULL,'00110458'),('00660885',14,20,NULL,'00110458'),('00660885',15,13,NULL,'00110458'),('00660885',16,19,NULL,'00110458'),('00661590',21,0,NULL,'00110458'),('00661590',22,8,NULL,'00110458'),('00661590',23,20,NULL,'00110458'),('00661590',24,10,NULL,'00110458'),('00661941',25,11,NULL,'00110458'),('00661941',26,10,NULL,'00110458'),('00661941',27,21,NULL,'00110458'),('00661941',28,20,NULL,'00110458'),('00662920',33,7,NULL,'999999'),('00662920',34,9,NULL,'999999'),('00662920',35,0,NULL,'999999'),('00662920',36,0,NULL,'999999'),('00665442',5,16,NULL,'999999'),('00665442',6,29,NULL,'999999'),('00665442',7,20,NULL,'999999'),('00665442',8,20,NULL,'999999'),('00665501',25,27,NULL,'00110458'),('00665501',26,20,NULL,'00110458'),('00665501',27,30,NULL,'00110458'),('00665501',28,20,NULL,'00110458'),('00672682',17,4,NULL,'00110458'),('00672682',18,11,NULL,'00110458'),('00672682',19,9,NULL,'00110458'),('00672682',20,26,NULL,'00110458'),('00673618',17,4,NULL,'00110458'),('00673618',18,25,NULL,'00110458'),('00673618',19,9,NULL,'00110458'),('00673618',20,30,NULL,'00110458'),('00673618',21,8,NULL,'00110458'),('00673618',22,30,NULL,'00110458'),('00673618',23,20,NULL,'00110458'),('00673618',24,30,NULL,'00110458'),('00676293',21,3,NULL,'00110458'),('00676293',22,26,NULL,'00110458'),('00676293',23,7,NULL,'00110458'),('00676293',24,25,NULL,'00110458'),('00676293',33,8,NULL,'999999'),('00676293',34,30,NULL,'999999'),('00676293',35,22,NULL,'999999'),('00676293',36,1,NULL,'999999'),('00683270',17,14,NULL,'00110458'),('00683270',18,10,NULL,'00110458'),('00683270',19,11,NULL,'00110458'),('00683270',20,26,NULL,'00110458'),('00683270',21,20,NULL,'00110458'),('00683270',22,30,NULL,'00110458'),('00683270',23,20,NULL,'00110458'),('00683270',24,30,NULL,'00110458'),('00683416',9,18,NULL,'999999'),('00683416',10,29,NULL,'999999'),('00683416',11,14,NULL,'999999'),('00683416',12,23,NULL,'999999'),('00684002',17,14,NULL,'00110458'),('00684002',18,30,NULL,'00110458'),('00684002',19,14,NULL,'00110458'),('00684002',20,26,NULL,'00110458'),('00684133',9,20,NULL,'999999'),('00684133',10,30,NULL,'999999'),('00684133',11,20,NULL,'999999'),('00684133',12,30,NULL,'999999'),('00686239',29,6,NULL,'00110458'),('00686239',30,19,NULL,'00110458'),('00686239',31,23,NULL,'00110458'),('00686239',32,3,NULL,'00110458'),('00690226',21,0,NULL,'00110458'),('00690226',22,18,NULL,'00110458'),('00690226',23,5,NULL,'00110458'),('00690226',24,23,NULL,'00110458'),('00690652',9,19,NULL,'999999'),('00690652',10,15,NULL,'999999'),('00690652',11,16,NULL,'999999'),('00690652',12,30,NULL,'999999'),('00695519',33,19,NULL,'999999'),('00695519',34,30,NULL,'999999'),('00695519',35,28,NULL,'999999'),('00695519',36,20,NULL,'999999'),('00695979',33,16,NULL,'999999'),('00695979',34,25,NULL,'999999'),('00695979',35,26,NULL,'999999'),('00695979',36,13,NULL,'999999'),('00696018',13,25,NULL,'00110458'),('00696018',14,30,NULL,'00110458'),('00696018',15,20,NULL,'00110458'),('00696018',16,20,NULL,'00110458'),('00698150',17,6,NULL,'00110458'),('00698150',18,14,NULL,'00110458'),('00698150',19,9,NULL,'00110458'),('00698150',20,13,NULL,'00110458'),('00703212',25,30,NULL,'00110458'),('00703212',26,20,NULL,'00110458'),('00703212',27,30,NULL,'00110458'),('00703212',28,20,NULL,'00110458'),('00703588',5,16,NULL,'999999'),('00703588',6,28,NULL,'999999'),('00703588',7,29,NULL,'999999'),('00703588',8,15,NULL,'999999'),('00703643',17,20,NULL,'00110458'),('00703643',18,20,NULL,'00110458'),('00703643',19,19,NULL,'00110458'),('00703643',20,30,NULL,'00110458'),('00705745',25,18,NULL,'00110458'),('00705745',26,1,NULL,'00110458'),('00705745',27,13,NULL,'00110458'),('00705745',28,6,NULL,'00110458'),('00705745',29,0,NULL,'00110458'),('00705745',30,20,NULL,'00110458'),('00705745',31,30,NULL,'00110458'),('00705745',32,20,NULL,'00110458'),('00705745',33,6,NULL,'999999'),('00705745',34,22,NULL,'999999'),('00705745',35,7,NULL,'999999'),('00705745',36,0,NULL,'999999'),('00715879',9,20,NULL,'999999'),('00715879',10,30,NULL,'999999'),('00715879',11,20,NULL,'999999'),('00715879',12,26,NULL,'999999'),('00716370',17,20,NULL,'00110458'),('00716370',18,30,NULL,'00110458'),('00716370',19,20,NULL,'00110458'),('00716370',20,30,NULL,'00110458'),('00720081',5,13,NULL,'999999'),('00720081',6,28,NULL,'999999'),('00720081',7,29,NULL,'999999'),('00720081',8,20,'wrong val','00110458'),('00720082',13,11,NULL,'00110458'),('00720082',14,5,NULL,'00110458'),('00720082',15,5,NULL,'00110458'),('00720082',16,1,NULL,'00110458'),('00720082',25,22,NULL,'00110458'),('00720082',26,10,NULL,'00110458'),('00720082',27,23,NULL,'00110458'),('00720082',28,6,NULL,'00110458'),('00720082',33,13,NULL,'999999'),('00720082',34,23,NULL,'999999'),('00720082',35,17,NULL,'999999'),('00720082',36,2,NULL,'999999'),('00720988',33,2,NULL,'999999'),('00720988',34,0,NULL,'999999'),('00720988',35,12,NULL,'999999'),('00720988',36,0,NULL,'999999'),('00721561',21,20,NULL,'00110458'),('00721561',22,30,NULL,'00110458'),('00721561',23,20,NULL,'00110458'),('00721561',24,30,NULL,'00110458'),('00722401',25,30,NULL,'00110458'),('00722401',26,4,NULL,'00110458'),('00722401',27,10,NULL,'00110458'),('00722401',28,4,NULL,'00110458'),('00722401',29,16,NULL,'00110458'),('00722401',30,29,NULL,'00110458'),('00722401',31,30,NULL,'00110458'),('00722401',32,10,NULL,'00110458'),('00724532',17,20,NULL,'00110458'),('00724532',18,30,NULL,'00110458'),('00724532',19,20,NULL,'00110458'),('00724532',20,30,NULL,'00110458'),('00726158',17,14,NULL,'00110458'),('00726158',18,10,NULL,'00110458'),('00726158',19,9,NULL,'00110458'),('00726158',20,24,NULL,'00110458'),('00726158',21,14,NULL,'00110458'),('00726158',22,20,NULL,'00110458'),('00726158',23,16,NULL,'00110458'),('00726158',24,30,NULL,'00110458'),('00727445',29,20,NULL,'00110458'),('00727445',30,30,NULL,'00110458'),('00727445',31,30,NULL,'00110458'),('00727445',32,20,NULL,'00110458'),('00730024',25,15,NULL,'00110458'),('00730024',26,13,NULL,'00110458'),('00730024',27,23,NULL,'00110458'),('00730024',28,11,NULL,'00110458'),('00730673',17,20,NULL,'00110458'),('00730673',18,30,NULL,'00110458'),('00730673',19,20,NULL,'00110458'),('00730673',20,30,NULL,'00110458'),('00734828',17,20,NULL,'00110458'),('00734828',18,30,NULL,'00110458'),('00734828',19,15,NULL,'00110458'),('00734828',20,22,NULL,'00110458'),('00737175',21,18,NULL,'00110458'),('00737175',22,30,NULL,'00110458'),('00737175',23,20,NULL,'00110458'),('00737175',24,30,NULL,'00110458'),('00737281',17,9,NULL,'00110458'),('00737281',18,10,NULL,'00110458'),('00737281',19,8,NULL,'00110458'),('00737281',20,18,NULL,'00110458'),('00737281',21,0,NULL,'00110458'),('00737281',22,22,NULL,'00110458'),('00737281',23,5,NULL,'00110458'),('00737281',24,17,NULL,'00110458'),('00740311',9,14,NULL,'999999'),('00740311',10,26,NULL,'999999'),('00740311',11,4,NULL,'999999'),('00740311',12,19,NULL,'999999'),('00740311',13,24,NULL,'00110458'),('00740311',14,30,NULL,'00110458'),('00740311',15,20,NULL,'00110458'),('00740311',16,16,NULL,'00110458'),('00740551',17,11,NULL,'00110458'),('00740551',18,14,NULL,'00110458'),('00740551',19,11,NULL,'00110458'),('00740551',20,20,NULL,'00110458'),('00740551',21,13,NULL,'00110458'),('00740551',22,18,NULL,'00110458'),('00740551',23,6,NULL,'00110458'),('00740551',24,18,NULL,'00110458'),('00740551',25,23,NULL,'00110458'),('00740551',26,0,NULL,'00110458'),('00740551',27,14,NULL,'00110458'),('00740551',28,2,NULL,'00110458'),('00743320',33,9,NULL,'999999'),('00743320',34,18,NULL,'999999'),('00743320',35,22,NULL,'999999'),('00743320',36,7,NULL,'999999'),('00743512',25,19,NULL,'00110458'),('00743512',26,7,NULL,'00110458'),('00743512',27,13,NULL,'00110458'),('00743512',28,7,NULL,'00110458'),('00743512',33,11,NULL,'999999'),('00743512',34,20,NULL,'999999'),('00743512',35,0,NULL,'999999'),('00743512',36,7,NULL,'999999'),('00745190',33,20,NULL,'999999'),('00745190',34,30,NULL,'999999'),('00745190',35,22,NULL,'999999'),('00745190',36,20,NULL,'999999'),('00745919',33,19,NULL,'999999'),('00745919',34,30,NULL,'999999'),('00745919',35,27,NULL,'999999'),('00745919',36,13,NULL,'999999'),('00746688',29,20,NULL,'00110458'),('00746688',30,25,NULL,'00110458'),('00746688',31,30,NULL,'00110458'),('00746688',32,19,NULL,'00110458'),('00747162',9,8,NULL,'999999'),('00747162',10,22,NULL,'999999'),('00747162',11,6,NULL,'999999'),('00747162',12,23,NULL,'999999'),('00747162',21,11,NULL,'00110458'),('00747162',22,28,NULL,'00110458'),('00747162',23,20,NULL,'00110458'),('00747162',24,28,NULL,'00110458'),('00747275',17,6,NULL,'00110458'),('00747275',18,14,NULL,'00110458'),('00747275',19,11,NULL,'00110458'),('00747275',20,22,NULL,'00110458'),('00747275',21,12,NULL,'00110458'),('00747275',22,30,NULL,'00110458'),('00747275',23,15,NULL,'00110458'),('00747275',24,30,NULL,'00110458'),('00748492',21,20,NULL,'00110458'),('00748492',22,29,NULL,'00110458'),('00748492',23,15,NULL,'00110458'),('00748492',24,24,NULL,'00110458'),('00748574',13,29,NULL,'00110458'),('00748574',14,30,NULL,'00110458'),('00748574',15,19,NULL,'00110458'),('00748574',16,20,NULL,'00110458'),('00750215',9,15,NULL,'999999'),('00750215',10,27,NULL,'999999'),('00750215',11,13,NULL,'999999'),('00750215',12,25,NULL,'999999'),('00751953',21,20,NULL,'00110458'),('00751953',22,30,NULL,'00110458'),('00751953',23,20,NULL,'00110458'),('00751953',24,29,NULL,'00110458'),('00752231',17,9,NULL,'00110458'),('00752231',18,30,NULL,'00110458'),('00752231',19,19,NULL,'00110458'),('00752231',20,30,NULL,'00110458'),('00752506',29,19,NULL,'00110458'),('00752506',30,30,NULL,'00110458'),('00752506',31,30,NULL,'00110458'),('00752506',32,20,NULL,'00110458'),('00752541',13,16,NULL,'00110458'),('00752541',14,30,NULL,'00110458'),('00752541',15,8,NULL,'00110458'),('00752541',16,2,NULL,'00110458'),('00752541',17,6,NULL,'00110458'),('00752541',18,0,NULL,'00110458'),('00752541',19,10,NULL,'00110458'),('00752541',20,14,NULL,'00110458'),('00752541',21,20,NULL,'00110458'),('00752541',22,22,NULL,'00110458'),('00752541',23,16,NULL,'00110458'),('00752541',24,30,NULL,'00110458'),('00754435',13,14,NULL,'00110458'),('00754435',14,14,NULL,'00110458'),('00754435',15,4,NULL,'00110458'),('00754435',16,12,NULL,'00110458'),('00754435',17,8,NULL,'00110458'),('00754435',18,8,NULL,'00110458'),('00754435',19,10,NULL,'00110458'),('00754435',20,17,NULL,'00110458'),('00754435',21,13,NULL,'00110458'),('00754435',22,30,NULL,'00110458'),('00754435',23,15,NULL,'00110458'),('00754435',24,28,NULL,'00110458'),('00760647',29,17,NULL,'00110458'),('00760647',30,26,NULL,'00110458'),('00760647',31,30,NULL,'00110458'),('00760647',32,20,NULL,'00110458'),('00761221',5,8,NULL,'999999'),('00761221',6,27,NULL,'999999'),('00761221',7,24,NULL,'999999'),('00761221',8,6,NULL,'999999'),('00761221',21,7,NULL,'00110458'),('00761221',22,28,NULL,'00110458'),('00761221',23,15,NULL,'00110458'),('00761221',24,30,NULL,'00110458'),('00762023',17,3,NULL,'00110458'),('00762023',18,14,NULL,'00110458'),('00762023',19,12,NULL,'00110458'),('00762023',20,23,NULL,'00110458'),('00762023',21,20,NULL,'00110458'),('00762023',22,29,NULL,'00110458'),('00762023',23,1,NULL,'00110458'),('00762023',24,30,NULL,'00110458'),('00762578',5,20,NULL,'999999'),('00762578',6,29,NULL,'999999'),('00762578',7,30,NULL,'999999'),('00762578',8,12,NULL,'999999'),('00768135',9,20,NULL,'999999'),('00768135',10,30,NULL,'999999'),('00768135',11,16,NULL,'999999'),('00768135',12,30,NULL,'999999'),('00773500',5,16,NULL,'999999'),('00773500',6,29,NULL,'999999'),('00773500',7,24,NULL,'999999'),('00773500',8,16,NULL,'999999'),('00774443',5,20,NULL,'999999'),('00774443',6,30,NULL,'999999'),('00774443',7,29,NULL,'999999'),('00774443',8,20,NULL,'999999'),('00774465',17,20,NULL,'00110458'),('00774465',18,30,NULL,'00110458'),('00774465',19,20,NULL,'00110458'),('00774465',20,30,NULL,'00110458'),('00775933',17,15,'dummy','00110458'),('00775933',18,20,'dummy','00110458'),('00775933',19,15,'dummy','00110458'),('00775933',20,20,'dummy','00110458'),('00775933',21,20,NULL,'00110458'),('00775933',22,21,NULL,'00110458'),('00775933',23,11,NULL,'00110458'),('00775933',24,26,NULL,'00110458'),('00776019',17,20,NULL,'00110458'),('00776019',18,30,NULL,'00110458'),('00776019',19,20,NULL,'00110458'),('00776019',20,30,NULL,'00110458'),('00778871',17,20,NULL,'00110458'),('00778871',18,30,NULL,'00110458'),('00778871',19,15,NULL,'00110458'),('00778871',20,30,NULL,'00110458'),('00779193',9,20,NULL,'999999'),('00779193',10,22,NULL,'999999'),('00779193',11,12,NULL,'999999'),('00779193',12,30,NULL,'999999'),('00782838',5,12,NULL,'999999'),('00782838',6,29,NULL,'999999'),('00782838',7,29,NULL,'999999'),('00782838',8,20,NULL,'999999'),('00786611',29,20,NULL,'00110458'),('00786611',30,27,NULL,'00110458'),('00786611',31,30,NULL,'00110458'),('00786611',32,20,NULL,'00110458'),('00786973',25,27,NULL,'00110458'),('00786973',26,15,NULL,'00110458'),('00786973',27,25,NULL,'00110458'),('00786973',28,13,NULL,'00110458'),('00788720',5,20,NULL,'999999'),('00788720',6,30,NULL,'999999'),('00788720',7,30,NULL,'999999'),('00788720',8,20,NULL,'999999'),('00788821',13,30,NULL,'00110458'),('00788821',14,28,NULL,'00110458'),('00788821',15,18,NULL,'00110458'),('00788821',16,16,NULL,'00110458'),('00789932',13,21,NULL,'00110458'),('00789932',14,30,NULL,'00110458'),('00789932',15,13,NULL,'00110458'),('00789932',16,18,NULL,'00110458'),('00791044',21,20,NULL,'00110458'),('00791044',22,30,NULL,'00110458'),('00791044',23,20,NULL,'00110458'),('00791044',24,30,NULL,'00110458'),('00791097',13,30,NULL,'00110458'),('00791097',14,30,NULL,'00110458'),('00791097',15,20,NULL,'00110458'),('00791097',16,20,NULL,'00110458'),('00791262',17,14,NULL,'00110458'),('00791262',18,14,NULL,'00110458'),('00791262',19,10,NULL,'00110458'),('00791262',20,26,NULL,'00110458'),('00792937',21,12,NULL,'00110458'),('00792937',22,30,NULL,'00110458'),('00792937',23,20,NULL,'00110458'),('00792937',24,30,NULL,'00110458'),('00796430',29,20,NULL,'00110458'),('00796430',30,30,NULL,'00110458'),('00796430',31,30,NULL,'00110458'),('00796430',32,20,NULL,'00110458'),('00797831',25,21,NULL,'00110458'),('00797831',26,6,NULL,'00110458'),('00797831',27,18,NULL,'00110458'),('00797831',28,1,NULL,'00110458'),('00798356',17,20,NULL,'00110458'),('00798356',18,30,NULL,'00110458'),('00798356',19,20,NULL,'00110458'),('00798356',20,30,NULL,'00110458'),('00798522',5,16,NULL,'999999'),('00798522',6,28,NULL,'999999'),('00798522',7,30,NULL,'999999'),('00798522',8,20,NULL,'999999'),('00798677',21,20,NULL,'00110458'),('00798677',22,24,NULL,'00110458'),('00798677',23,14,NULL,'00110458'),('00798677',24,29,NULL,'00110458'),('00799553',21,20,NULL,'00110458'),('00799553',22,18,NULL,'00110458'),('00799553',23,19,NULL,'00110458'),('00799553',24,26,NULL,'00110458'),('00799679',21,8,NULL,'00110458'),('00799679',22,30,NULL,'00110458'),('00799679',23,1,NULL,'00110458'),('00799679',24,9,NULL,'00110458'),('00800585',9,18,NULL,'999999'),('00800585',10,26,NULL,'999999'),('00800585',11,15,NULL,'999999'),('00800585',12,25,NULL,'999999'),('00800724',9,20,NULL,'999999'),('00800724',10,26,NULL,'999999'),('00800724',11,19,NULL,'999999'),('00800724',12,23,NULL,'999999'),('00800830',21,4,NULL,'00110458'),('00800830',22,3,NULL,'00110458'),('00800830',23,6,NULL,'00110458'),('00800830',24,27,NULL,'00110458'),('00800830',25,24,NULL,'00110458'),('00800830',26,16,NULL,'00110458'),('00800830',27,23,NULL,'00110458'),('00800830',28,19,NULL,'00110458'),('00802207',33,3,NULL,'999999'),('00802207',34,11,NULL,'999999'),('00802207',35,22,NULL,'999999'),('00802207',36,5,NULL,'999999'),('00802866',17,14,NULL,'00110458'),('00802866',18,25,NULL,'00110458'),('00802866',19,19,NULL,'00110458'),('00802866',20,21,NULL,'00110458'),('00803414',9,20,NULL,'999999'),('00803414',10,24,NULL,'999999'),('00803414',11,15,NULL,'999999'),('00803414',12,23,NULL,'999999'),('00805308',17,20,NULL,'00110458'),('00805308',18,30,NULL,'00110458'),('00805308',19,20,NULL,'00110458'),('00805308',20,30,NULL,'00110458'),('00806509',17,13,NULL,'00110458'),('00806509',18,10,NULL,'00110458'),('00806509',19,19,NULL,'00110458'),('00806509',20,10,NULL,'00110458'),('00806509',21,20,NULL,'00110458'),('00806509',22,25,NULL,'00110458'),('00806509',23,20,NULL,'00110458'),('00806509',24,30,NULL,'00110458'),('00807114',25,17,NULL,'00110458'),('00807114',26,12,NULL,'00110458'),('00807114',27,10,NULL,'00110458'),('00807114',28,10,NULL,'00110458'),('00809142',5,18,NULL,'999999'),('00809142',6,28,NULL,'999999'),('00809142',7,25,NULL,'999999'),('00809142',8,9,NULL,'999999'),('00809260',5,11,NULL,'999999'),('00809260',6,30,NULL,'999999'),('00809260',7,15,NULL,'999999'),('00809260',8,3,NULL,'999999'),('00809260',13,26,NULL,'00110458'),('00809260',14,30,NULL,'00110458'),('00809260',15,20,NULL,'00110458'),('00809260',16,18,NULL,'00110458'),('00811072',9,15,NULL,'999999'),('00811072',10,30,NULL,'999999'),('00811072',11,17,NULL,'999999'),('00811072',12,30,NULL,'999999'),('00811872',25,18,NULL,'00110458'),('00811872',26,10,NULL,'00110458'),('00811872',27,18,NULL,'00110458'),('00811872',28,9,NULL,'00110458'),('00811872',33,2,NULL,'999999'),('00811872',34,10,NULL,'999999'),('00811872',35,15,NULL,'999999'),('00811872',36,1,NULL,'999999'),('00814071',13,26,NULL,'00110458'),('00814071',14,30,NULL,'00110458'),('00814071',15,17,NULL,'00110458'),('00814071',16,17,NULL,'00110458'),('00818407',5,9,NULL,'999999'),('00818407',6,30,NULL,'999999'),('00818407',7,22,NULL,'999999'),('00818407',8,20,NULL,'999999'),('00818813',5,20,NULL,'999999'),('00818813',6,29,NULL,'999999'),('00818813',7,30,NULL,'999999'),('00818813',8,20,NULL,'999999'),('00820006',25,22,NULL,'00110458'),('00820006',26,15,NULL,'00110458'),('00820006',27,24,NULL,'00110458'),('00820006',28,19,NULL,'00110458'),('00820273',17,13,NULL,'00110458'),('00820273',18,30,NULL,'00110458'),('00820273',19,11,NULL,'00110458'),('00820273',20,18,NULL,'00110458'),('00820273',21,4,NULL,'00110458'),('00820273',22,27,NULL,'00110458'),('00820273',23,18,NULL,'00110458'),('00820273',24,15,NULL,'00110458'),('00823483',5,16,NULL,'999999'),('00823483',6,28,NULL,'999999'),('00823483',7,27,NULL,'999999'),('00823483',8,17,NULL,'999999'),('00824242',9,19,NULL,'999999'),('00824242',10,21,NULL,'999999'),('00824242',11,14,NULL,'999999'),('00824242',12,17,NULL,'999999'),('00824242',13,29,NULL,'00110458'),('00824242',14,30,NULL,'00110458'),('00824242',15,20,NULL,'00110458'),('00824242',16,20,NULL,'00110458'),('00824282',21,16,NULL,'00110458'),('00824282',22,30,NULL,'00110458'),('00824282',23,20,NULL,'00110458'),('00824282',24,30,NULL,'00110458'),('00824395',25,26,NULL,'00110458'),('00824395',26,14,NULL,'00110458'),('00824395',27,26,NULL,'00110458'),('00824395',28,16,NULL,'00110458'),('00824436',17,18,NULL,'00110458'),('00824436',18,30,NULL,'00110458'),('00824436',19,20,NULL,'00110458'),('00824436',20,30,NULL,'00110458'),('00825414',25,11,NULL,'00110458'),('00825414',26,14,NULL,'00110458'),('00825414',27,20,NULL,'00110458'),('00825414',28,7,NULL,'00110458'),('00825414',29,17,NULL,'00110458'),('00825414',30,28,NULL,'00110458'),('00825414',31,30,NULL,'00110458'),('00825414',32,12,NULL,'00110458'),('00826552',5,13,NULL,'999999'),('00826552',6,28,NULL,'999999'),('00826552',7,19,NULL,'999999'),('00826552',8,14,NULL,'999999'),('00826552',9,15,NULL,'999999'),('00826552',10,30,NULL,'999999'),('00826552',11,20,NULL,'999999'),('00826552',12,30,NULL,'999999'),('00827258',25,4,NULL,'00110458'),('00827258',26,9,NULL,'00110458'),('00827258',27,3,NULL,'00110458'),('00827258',28,15,NULL,'00110458'),('00828272',21,2,NULL,'00110458'),('00828272',22,7,NULL,'00110458'),('00828272',23,1,NULL,'00110458'),('00828272',24,18,NULL,'00110458'),('00828272',29,5,NULL,'00110458'),('00828272',30,28,NULL,'00110458'),('00828272',31,12,NULL,'00110458'),('00828272',32,11,NULL,'00110458'),('00828855',21,20,NULL,'00110458'),('00828855',22,4,NULL,'00110458'),('00828855',23,11,NULL,'00110458'),('00828855',24,28,NULL,'00110458'),('00829937',17,0,NULL,'00110458'),('00829937',18,0,NULL,'00110458'),('00829937',19,6,NULL,'00110458'),('00829937',20,13,NULL,'00110458'),('00829937',21,20,NULL,'00110458'),('00829937',22,20,NULL,'00110458'),('00829937',23,15,NULL,'00110458'),('00829937',24,14,NULL,'00110458'),('00829937',33,6,NULL,'999999'),('00829937',34,23,NULL,'999999'),('00829937',35,30,NULL,'999999'),('00829937',36,5,NULL,'999999'),('00830717',21,1,NULL,'00110458'),('00830717',22,3,NULL,'00110458'),('00830717',23,4,NULL,'00110458'),('00830717',24,2,NULL,'00110458'),('00830717',33,2,NULL,'999999'),('00830717',34,20,NULL,'999999'),('00830717',35,18,NULL,'999999'),('00830717',36,0,NULL,'999999'),('00831433',25,22,NULL,'00110458'),('00831433',26,12,NULL,'00110458'),('00831433',27,8,NULL,'00110458'),('00831433',28,11,NULL,'00110458'),('00831433',33,10,NULL,'999999'),('00831433',34,23,NULL,'999999'),('00831433',35,30,NULL,'999999'),('00831433',36,8,NULL,'999999'),('00831785',17,20,NULL,'00110458'),('00831785',18,10,NULL,'00110458'),('00831785',19,20,NULL,'00110458'),('00831785',20,26,NULL,'00110458'),('00831938',29,19,NULL,'00110458'),('00831938',30,15,NULL,'00110458'),('00831938',31,30,NULL,'00110458'),('00831938',32,16,NULL,'00110458'),('00832358',29,20,NULL,'00110458'),('00832358',30,30,NULL,'00110458'),('00832358',31,30,NULL,'00110458'),('00832358',32,20,NULL,'00110458'),('00832361',25,25,NULL,'00110458'),('00832361',26,15,NULL,'00110458'),('00832361',27,29,NULL,'00110458'),('00832361',28,11,NULL,'00110458'),('00833351',21,20,NULL,'00110458'),('00833351',22,20,NULL,'00110458'),('00833351',23,20,NULL,'00110458'),('00833351',24,30,NULL,'00110458'),('00833384',9,17,NULL,'999999'),('00833384',10,26,NULL,'999999'),('00833384',11,11,NULL,'999999'),('00833384',12,26,NULL,'999999'),('00833794',33,19,NULL,'999999'),('00833794',34,30,NULL,'999999'),('00833794',35,22,NULL,'999999'),('00833794',36,12,NULL,'999999'),('00834314',17,14,NULL,'00110458'),('00834314',18,15,NULL,'00110458'),('00834314',19,17,NULL,'00110458'),('00834314',20,30,NULL,'00110458'),('00835796',9,20,NULL,'999999'),('00835796',10,28,NULL,'999999'),('00835796',11,16,NULL,'999999'),('00835796',12,23,NULL,'999999'),('00836522',21,7,NULL,'00110458'),('00836522',22,1,NULL,'00110458'),('00836522',23,3,NULL,'00110458'),('00836522',24,22,NULL,'00110458'),('00836522',29,10,NULL,'00110458'),('00836522',30,23,NULL,'00110458'),('00836522',31,30,NULL,'00110458'),('00836522',32,20,NULL,'00110458'),('00837320',25,30,NULL,'00110458'),('00837320',26,15,NULL,'00110458'),('00837320',27,25,NULL,'00110458'),('00837320',28,17,NULL,'00110458'),('00837566',21,5,NULL,'00110458'),('00837566',22,24,NULL,'00110458'),('00837566',23,9,NULL,'00110458'),('00837566',24,25,NULL,'00110458'),('00837566',33,8,NULL,'999999'),('00837566',34,30,NULL,'999999'),('00837566',35,14,NULL,'999999'),('00837566',36,7,NULL,'999999'),('00837694',21,20,NULL,'00110458'),('00837694',22,30,NULL,'00110458'),('00837694',23,20,NULL,'00110458'),('00837694',24,28,NULL,'00110458'),('00838381',25,30,NULL,'00110458'),('00838381',26,20,NULL,'00110458'),('00838381',27,30,NULL,'00110458'),('00838381',28,20,NULL,'00110458'),('00838382',33,7,NULL,'999999'),('00838382',34,10,NULL,'999999'),('00838382',35,12,NULL,'999999'),('00838382',36,0,NULL,'999999'),('00838607',25,29,NULL,'00110458'),('00838607',26,15,NULL,'00110458'),('00838607',27,28,NULL,'00110458'),('00838607',28,18,NULL,'00110458'),('00839659',25,30,NULL,'00110458'),('00839659',26,20,NULL,'00110458'),('00839659',27,30,NULL,'00110458'),('00839659',28,20,NULL,'00110458'),('00839729',29,2,NULL,'00110458'),('00839729',30,7,NULL,'00110458'),('00839729',31,19,NULL,'00110458'),('00839729',32,6,NULL,'00110458'),('00840491',17,14,NULL,'00110458'),('00840491',18,27,NULL,'00110458'),('00840491',19,20,NULL,'00110458'),('00840491',20,30,NULL,'00110458'),('00841467',33,16,NULL,'999999'),('00841467',34,29,NULL,'999999'),('00841467',35,26,NULL,'999999'),('00841467',36,15,NULL,'999999'),('00841728',17,14,NULL,'00110458'),('00841728',18,24,NULL,'00110458'),('00841728',19,20,NULL,'00110458'),('00841728',20,21,NULL,'00110458'),('00842162',21,20,NULL,'00110458'),('00842162',22,29,NULL,'00110458'),('00842162',23,20,NULL,'00110458'),('00842162',24,30,NULL,'00110458'),('00842417',33,15,NULL,'999999'),('00842417',34,27,NULL,'999999'),('00842417',35,24,NULL,'999999'),('00842417',36,14,NULL,'999999'),('00843349',21,18,NULL,'00110458'),('00843349',22,20,NULL,'00110458'),('00843349',23,5,NULL,'00110458'),('00843349',24,29,NULL,'00110458'),('00843349',25,29,NULL,'00110458'),('00843349',26,20,NULL,'00110458'),('00843349',27,30,NULL,'00110458'),('00843349',28,6,NULL,'00110458'),('00843433',29,20,NULL,'00110458'),('00843433',30,29,NULL,'00110458'),('00843433',31,24,NULL,'00110458'),('00843433',32,18,NULL,'00110458'),('00843997',21,2,NULL,'00110458'),('00843997',22,17,NULL,'00110458'),('00843997',23,6,NULL,'00110458'),('00843997',24,21,NULL,'00110458'),('00843997',25,14,NULL,'00110458'),('00843997',26,6,NULL,'00110458'),('00843997',27,18,NULL,'00110458'),('00843997',28,9,NULL,'00110458'),('00846988',25,30,NULL,'00110458'),('00846988',26,20,NULL,'00110458'),('00846988',27,30,NULL,'00110458'),('00846988',28,19,NULL,'00110458'),('00847362',29,2,NULL,'00110458'),('00847362',30,9,NULL,'00110458'),('00847362',31,4,NULL,'00110458'),('00847362',32,1,NULL,'00110458'),('00848588',29,20,NULL,'00110458'),('00848588',30,30,NULL,'00110458'),('00848588',31,30,NULL,'00110458'),('00848588',32,20,NULL,'00110458'),('00848671',13,30,NULL,'00110458'),('00848671',14,30,NULL,'00110458'),('00848671',15,20,NULL,'00110458'),('00848671',16,20,NULL,'00110458'),('00850213',13,27,NULL,'00110458'),('00850213',14,30,NULL,'00110458'),('00850213',15,12,NULL,'00110458'),('00850213',16,11,NULL,'00110458'),('00852001',17,0,NULL,'00110458'),('00852001',18,6,NULL,'00110458'),('00852001',19,5,NULL,'00110458'),('00852001',20,14,NULL,'00110458'),('00852001',21,0,NULL,'00110458'),('00852001',22,5,NULL,'00110458'),('00852001',23,1,NULL,'00110458'),('00852001',24,3,NULL,'00110458'),('00852001',29,3,NULL,'00110458'),('00852001',30,19,NULL,'00110458'),('00852001',31,17,NULL,'00110458'),('00852001',32,14,NULL,'00110458'),('00852001',33,4,NULL,'999999'),('00852001',34,23,NULL,'999999'),('00852001',35,15,NULL,'999999'),('00852001',36,0,NULL,'999999'),('00853686',21,20,NULL,'00110458'),('00853686',22,14,NULL,'00110458'),('00853686',23,14,NULL,'00110458'),('00853686',24,18,NULL,'00110458'),('00854656',5,8,NULL,'999999'),('00854656',6,28,NULL,'999999'),('00854656',7,17,NULL,'999999'),('00854656',8,7,NULL,'999999'),('00855412',5,20,NULL,'999999'),('00855412',6,25,NULL,'999999'),('00855412',7,30,NULL,'999999'),('00855412',8,20,NULL,'999999'),('00855585',13,14,NULL,'00110458'),('00855585',14,23,NULL,'00110458'),('00855585',15,3,NULL,'00110458'),('00855585',16,0,NULL,'00110458'),('00855585',17,7,NULL,'00110458'),('00855585',18,30,NULL,'00110458'),('00855585',19,17,NULL,'00110458'),('00855585',20,30,NULL,'00110458'),('00855923',29,11,NULL,'00110458'),('00855923',30,15,NULL,'00110458'),('00855923',31,14,NULL,'00110458'),('00855923',32,0,NULL,'00110458'),('00855923',33,2,NULL,'999999'),('00855923',34,21,NULL,'999999'),('00855923',35,14,NULL,'999999'),('00855923',36,2,NULL,'999999'),('00855930',29,4,NULL,'00110458'),('00855930',30,9,NULL,'00110458'),('00855930',31,2,NULL,'00110458'),('00855930',32,1,NULL,'00110458'),('00855930',33,0,NULL,'999999'),('00855930',34,19,NULL,'999999'),('00855930',35,10,NULL,'999999'),('00855930',36,4,NULL,'999999'),('00856621',21,2,NULL,'00110458'),('00856621',22,24,NULL,'00110458'),('00856621',23,12,NULL,'00110458'),('00856621',24,28,NULL,'00110458'),('00856621',25,27,NULL,'00110458'),('00856621',26,10,NULL,'00110458'),('00856621',27,25,NULL,'00110458'),('00856621',28,19,NULL,'00110458'),('00858728',25,30,NULL,'00110458'),('00858728',26,15,NULL,'00110458'),('00858728',27,24,NULL,'00110458'),('00858728',28,17,NULL,'00110458'),('00859429',21,12,NULL,'00110458'),('00859429',22,18,NULL,'00110458'),('00859429',23,3,NULL,'00110458'),('00859429',24,20,NULL,'00110458'),('00860772',13,19,NULL,'00110458'),('00860772',14,30,NULL,'00110458'),('00860772',15,12,NULL,'00110458'),('00860772',16,8,NULL,'00110458'),('00860827',5,7,NULL,'999999'),('00860827',6,17,NULL,'999999'),('00860827',7,6,NULL,'999999'),('00860827',8,1,NULL,'999999'),('00860827',21,19,NULL,'00110458'),('00860827',22,30,NULL,'00110458'),('00860827',23,16,NULL,'00110458'),('00860827',24,30,NULL,'00110458'),('00860978',33,5,NULL,'999999'),('00860978',34,16,NULL,'999999'),('00860978',35,18,NULL,'999999'),('00860978',36,1,NULL,'999999'),('00861401',33,19,NULL,'999999'),('00861401',34,30,NULL,'999999'),('00861401',35,30,NULL,'999999'),('00861401',36,20,NULL,'999999'),('00861687',17,17,NULL,'00110458'),('00861687',18,27,NULL,'00110458'),('00861687',19,20,NULL,'00110458'),('00861687',20,30,NULL,'00110458'),('00862105',13,19,NULL,'00110458'),('00862105',14,30,NULL,'00110458'),('00862105',15,11,NULL,'00110458'),('00862105',16,20,NULL,'00110458'),('00862422',25,25,NULL,'00110458'),('00862422',26,5,NULL,'00110458'),('00862422',27,19,NULL,'00110458'),('00862422',28,9,NULL,'00110458'),('00862422',33,6,NULL,'999999'),('00862422',34,30,NULL,'999999'),('00862422',35,14,NULL,'999999'),('00862422',36,1,NULL,'999999'),('00862508',21,14,NULL,'00110458'),('00862508',22,24,NULL,'00110458'),('00862508',23,12,NULL,'00110458'),('00862508',24,16,NULL,'00110458'),('00862608',17,20,NULL,'00110458'),('00862608',18,30,NULL,'00110458'),('00862608',19,16,NULL,'00110458'),('00862608',20,26,NULL,'00110458'),('00863328',9,20,NULL,'999999'),('00863328',10,30,NULL,'999999'),('00863328',11,20,NULL,'999999'),('00863328',12,30,NULL,'999999'),('00863332',21,20,NULL,'00110458'),('00863332',22,30,NULL,'00110458'),('00863332',23,20,NULL,'00110458'),('00863332',24,28,NULL,'00110458'),('00863485',29,3,NULL,'00110458'),('00863485',30,10,NULL,'00110458'),('00863485',31,4,NULL,'00110458'),('00863485',32,0,NULL,'00110458'),('00863485',33,8,NULL,'999999'),('00863485',34,22,NULL,'999999'),('00863485',35,12,NULL,'999999'),('00863485',36,0,NULL,'999999'),('00864050',25,30,NULL,'00110458'),('00864050',26,20,NULL,'00110458'),('00864050',27,30,NULL,'00110458'),('00864050',28,20,NULL,'00110458'),('00864163',33,17,NULL,'999999'),('00864163',34,29,NULL,'999999'),('00864163',35,27,NULL,'999999'),('00864163',36,7,NULL,'999999'),('00864761',5,8,NULL,'999999'),('00864761',6,17,NULL,'999999'),('00864761',7,4,NULL,'999999'),('00864761',8,20,NULL,'999999'),('00864761',17,11,NULL,'00110458'),('00864761',18,10,NULL,'00110458'),('00864761',19,13,NULL,'00110458'),('00864761',20,24,NULL,'00110458'),('00864761',25,26,NULL,'00110458'),('00864761',26,15,NULL,'00110458'),('00864761',27,24,NULL,'00110458'),('00864761',28,20,NULL,'00110458'),('00864955',9,20,NULL,'999999'),('00864955',10,30,NULL,'999999'),('00864955',11,20,NULL,'999999'),('00864955',12,30,NULL,'999999'),('00865390',29,11,NULL,'00110458'),('00865390',30,19,NULL,'00110458'),('00865390',31,26,NULL,'00110458'),('00865390',32,9,NULL,'00110458'),('00865390',33,5,NULL,'999999'),('00865390',34,23,NULL,'999999'),('00865390',35,14,NULL,'999999'),('00865390',36,5,NULL,'999999'),('00865418',25,26,NULL,'00110458'),('00865418',26,11,NULL,'00110458'),('00865418',27,27,NULL,'00110458'),('00865418',28,16,NULL,'00110458'),('00866912',9,20,NULL,'999999'),('00866912',10,17,NULL,'999999'),('00866912',11,16,NULL,'999999'),('00866912',12,27,NULL,'999999'),('00867467',21,20,NULL,'00110458'),('00867467',22,30,NULL,'00110458'),('00867467',23,20,NULL,'00110458'),('00867467',24,30,NULL,'00110458'),('00868924',13,17,NULL,'00110458'),('00868924',14,17,NULL,'00110458'),('00868924',15,8,NULL,'00110458'),('00868924',16,17,NULL,'00110458'),('00868924',17,9,NULL,'00110458'),('00868924',18,0,NULL,'00110458'),('00868924',19,4,NULL,'00110458'),('00868924',20,30,NULL,'00110458'),('00868924',21,20,NULL,'00110458'),('00868924',22,30,NULL,'00110458'),('00868924',23,20,NULL,'00110458'),('00868924',24,30,NULL,'00110458'),('00868935',29,6,NULL,'00110458'),('00868935',30,12,NULL,'00110458'),('00868935',31,7,NULL,'00110458'),('00868935',32,13,NULL,'00110458'),('00868935',33,7,NULL,'999999'),('00868935',34,23,NULL,'999999'),('00868935',35,14,NULL,'999999'),('00868935',36,1,NULL,'999999'),('00869184',13,20,NULL,'00110458'),('00869184',14,21,NULL,'00110458'),('00869184',15,14,NULL,'00110458'),('00869184',16,4,NULL,'00110458'),('00869184',17,8,NULL,'00110458'),('00869184',18,24,NULL,'00110458'),('00869184',19,17,NULL,'00110458'),('00869184',20,28,NULL,'00110458'),('00869654',5,16,NULL,'999999'),('00869654',6,29,NULL,'999999'),('00869654',7,22,NULL,'999999'),('00869654',8,1,NULL,'999999'),('00869654',9,20,NULL,'999999'),('00869654',10,30,NULL,'999999'),('00869654',11,20,NULL,'999999'),('00869654',12,30,NULL,'999999'),('00870215',29,17,NULL,'00110458'),('00870215',30,21,NULL,'00110458'),('00870215',31,26,NULL,'00110458'),('00870215',32,5,NULL,'00110458'),('00870215',33,7,NULL,'999999'),('00870215',34,23,NULL,'999999'),('00870215',35,19,NULL,'999999'),('00870215',36,14,NULL,'999999'),('00870694',21,20,NULL,'00110458'),('00870694',22,26,NULL,'00110458'),('00870694',23,4,NULL,'00110458'),('00870694',24,30,NULL,'00110458'),('00871388',33,20,NULL,'999999'),('00871388',34,30,NULL,'999999'),('00871388',35,30,NULL,'999999'),('00871388',36,20,NULL,'999999'),('00872491',33,8,NULL,'999999'),('00872491',34,9,NULL,'999999'),('00872491',35,17,NULL,'999999'),('00872491',36,9,NULL,'999999'),('00873694',13,30,NULL,'00110458'),('00873694',14,30,NULL,'00110458'),('00873694',15,20,NULL,'00110458'),('00873694',16,20,NULL,'00110458'),('00876144',17,8,NULL,'00110458'),('00876144',18,25,NULL,'00110458'),('00876144',19,14,NULL,'00110458'),('00876144',20,14,NULL,'00110458'),('00876144',21,2,NULL,'00110458'),('00876144',22,27,NULL,'00110458'),('00876144',23,11,NULL,'00110458'),('00876144',24,30,NULL,'00110458'),('00876144',25,30,NULL,'00110458'),('00876144',26,15,NULL,'00110458'),('00876144',27,29,NULL,'00110458'),('00876144',28,20,NULL,'00110458'),('00877202',21,5,NULL,'00110458'),('00877202',22,19,NULL,'00110458'),('00877202',23,3,NULL,'00110458'),('00877202',24,21,NULL,'00110458'),('00877202',25,30,NULL,'00110458'),('00877202',26,13,NULL,'00110458'),('00877202',27,27,NULL,'00110458'),('00877202',28,10,NULL,'00110458'),('00877318',17,11,NULL,'00110458'),('00877318',18,25,NULL,'00110458'),('00877318',19,6,NULL,'00110458'),('00877318',20,23,NULL,'00110458'),('00878721',25,30,NULL,'00110458'),('00878721',26,15,NULL,'00110458'),('00878721',27,30,NULL,'00110458'),('00878721',28,20,NULL,'00110458'),('00880260',33,16,NULL,'999999'),('00880260',34,18,NULL,'999999'),('00880260',35,22,NULL,'999999'),('00880260',36,12,NULL,'999999'),('00881272',21,20,NULL,'00110458'),('00881272',22,30,NULL,'00110458'),('00881272',23,20,NULL,'00110458'),('00881272',24,30,NULL,'00110458'),('00881540',29,11,NULL,'00110458'),('00881540',30,21,NULL,'00110458'),('00881540',31,30,NULL,'00110458'),('00881540',32,18,NULL,'00110458'),('00882149',33,20,NULL,'999999'),('00882149',34,30,NULL,'999999'),('00882149',35,22,NULL,'999999'),('00882149',36,13,NULL,'999999'),('00884801',33,3,NULL,'999999'),('00884801',34,13,NULL,'999999'),('00884801',35,8,NULL,'999999'),('00884801',36,0,NULL,'999999'),('00885810',21,20,NULL,'00110458'),('00885810',22,30,NULL,'00110458'),('00885810',23,16,NULL,'00110458'),('00885810',24,24,NULL,'00110458'),('00885852',25,30,NULL,'00110458'),('00885852',26,20,NULL,'00110458'),('00885852',27,30,NULL,'00110458'),('00885852',28,20,NULL,'00110458'),('00891529',21,20,NULL,'00110458'),('00891529',22,30,NULL,'00110458'),('00891529',23,20,NULL,'00110458'),('00891529',24,28,NULL,'00110458'),('00891860',21,1,NULL,'00110458'),('00891860',22,28,NULL,'00110458'),('00891860',23,7,NULL,'00110458'),('00891860',24,30,NULL,'00110458'),('00891860',29,16,NULL,'00110458'),('00891860',30,28,NULL,'00110458'),('00891860',31,30,NULL,'00110458'),('00891860',32,20,NULL,'00110458'),('00891881',25,30,NULL,'00110458'),('00891881',26,20,NULL,'00110458'),('00891881',27,30,NULL,'00110458'),('00891881',28,20,NULL,'00110458'),('00892986',17,2,NULL,'00110458'),('00892986',18,30,NULL,'00110458'),('00892986',19,18,NULL,'00110458'),('00892986',20,17,NULL,'00110458'),('00892986',21,5,NULL,'00110458'),('00892986',22,30,NULL,'00110458'),('00892986',23,17,NULL,'00110458'),('00892986',24,30,NULL,'00110458'),('00895269',25,21,NULL,'00110458'),('00895269',26,0,NULL,'00110458'),('00895269',27,12,NULL,'00110458'),('00895269',28,8,NULL,'00110458'),('00897833',33,16,NULL,'999999'),('00897833',34,30,NULL,'999999'),('00897833',35,29,NULL,'999999'),('00897833',36,12,NULL,'999999'),('00898793',29,10,NULL,'00110458'),('00898793',30,6,NULL,'00110458'),('00898793',31,28,NULL,'00110458'),('00898793',32,3,NULL,'00110458'),('00898793',33,7,NULL,'999999'),('00898793',34,20,NULL,'999999'),('00898793',35,22,NULL,'999999'),('00898793',36,0,NULL,'999999'),('00899128',33,20,NULL,'999999'),('00899128',34,30,NULL,'999999'),('00899128',35,30,NULL,'999999'),('00899128',36,20,NULL,'999999'),('00899308',25,30,NULL,'00110458'),('00899308',26,15,NULL,'00110458'),('00899308',27,22,NULL,'00110458'),('00899308',28,20,NULL,'00110458'),('00904365',25,25,NULL,'00110458'),('00904365',26,8,NULL,'00110458'),('00904365',27,12,NULL,'00110458'),('00904365',28,10,NULL,'00110458'),('00904365',33,4,NULL,'999999'),('00904365',34,19,NULL,'999999'),('00904365',35,22,NULL,'999999'),('00904365',36,7,NULL,'999999'),('00907799',25,30,NULL,'00110458'),('00907799',26,14,NULL,'00110458'),('00907799',27,30,NULL,'00110458'),('00907799',28,20,NULL,'00110458'),('00921490',33,4,NULL,'999999'),('00921490',34,0,NULL,'999999'),('00921490',35,4,NULL,'999999'),('00921490',36,3,NULL,'999999'),('00921972',25,25,NULL,'00110458'),('00921972',26,13,NULL,'00110458'),('00921972',27,30,NULL,'00110458'),('00921972',28,18,NULL,'00110458');
/*!40000 ALTER TABLE `student_cat_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` varchar(15) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('000','000','000','000',0),('00046759','Stu','Steiner','ssteiner@ewu.edu',0),('00101087','Todd','Lahman','tlahman@eagles.ewu.edu',0),('00110458','Tom','Capaul','tcapaul@ewu.edu',0),('00132105','Anthony','Beam','abeam1@eagles.ewu.edu',0),('00227170','Jeffrey','Howes','jhowes@eagles.ewu.edu',0),('00234980','Shawn','Welch','swelch6@eagles.ewu.edu',0),('00405335','Nathan','Hiblar','nhiblar@eagles.ewu.edu',0),('00459043','Steven','Mcconnell','smcconnell2@eagles.ewu.edu',0),('00497657','Scott','Shoup','sshoup@eagles.ewu.edu',0),('00519357','Jesse','Javana','jjavana@eagles.ewu.edu',0),('00552599','Roon','Le','lostbylove@eagles.ewu.edu',0),('00555132','Douglas','Doner','ddoner32@eagles.ewu.edu',0),('00605013','Jessica','Hartman','jhartman3@eagles.ewu.edu',0),('00610258','Christopher','Davisson','cdavisson58@eagles.ewu.edu',0),('00614668','Zachery','Schuerer','zacherys@eagles.ewu.edu',0),('00615459','Rahel','Haileyesus','rhaileyesus59@eagles.ewu.edu',0),('00622901','Eric','Gilmour','E_Gilmour@eagles.ewu.edu',0),('00623077','Yodit','Haileyesus','yhhaileyesus@eagles.ewu.edu',0),('00626064','Valdyn','Hunt','vhunt@eagles.ewu.edu',0),('00629405','Chelsea','Rickman','crickman1@eagles.ewu.edu',0),('00654381','Thomas','Pollard','tdpollard24@eagles.ewu.edu',0),('00655925','Evan','Bell','ebell@eagles.ewu.edu',0),('00657423','Garrett','Lawless','glawless@eagles.ewu.edu',0),('00657576','Muangkong','Yang','myang5@eagles.ewu.edu',0),('00658719','Ryan','Knight','ryanknight@eagles.ewu.edu',0),('00660885','Artem','Elikh','aelikh@eagles.ewu.edu',0),('00661590','Kurtis','Haren','kharen@eagles.ewu.edu',0),('00661941','Brandon','Aujla','baujla@eagles.ewu.edu',0),('00662920','Nicholas','Gainer','ngainer@eagles.ewu.edu',0),('00665442','Kaylene','Petrin','kpetrin@eagles.ewu.edu',0),('00665501','Morgane','Wecker-Guill','mguill@eagles.ewu.edu',0),('00672682','Ryan','Kempffer','ryan.kempffer@eagles.ewu.edu',0),('00673618','Austen','Frostad','afrostad@ewu.edu',0),('00676293','Johnathan','Knoll','jknoll2@eagles.ewu.edu',0),('00683270','Eric','Barrio','ebarrio19@eagles.ewu.edu',0),('00683416','Jake','Norisada','jakenorisada@eagles.ewu.edu',0),('00684002','Hope','Marshall','hmarshall2@eagles.ewu.edu',0),('00684133','Hannah','Lord','hmanon@eagles.ewu.edu',0),('00686239','Melody','Kinyon','mkinyon@eagles.ewu.edu',0),('00690226','Adam','Bernard','abernard1@eagles.ewu.edu',0),('00690652','Jacob','Berger','jberger8@eagles.ewu.edu',0),('00695519','Dru','Martin','Martindru5@eagles.ewu.edu',0),('00695979','Justin','Entz','jentz1@eagles.ewu.edu',0),('00696018','Kira','Hodge','kira.hodge@eagles.ewu.edu',0),('00697147','Cameron','Hilsmann','Cameron.hilsmann@eagles.ewu.edu',0),('00698150','Michael','Telecky','mtelecky@eagles.ewu.edu',0),('00699739','Ian','Case','icase@ewu.edu',0),('00703212','Bryan','Wilson','bwilson15@eagles.ewu.edu',0),('00703588','Nickolas','Condos','ncondos@eagles.ewu.edu',0),('00703643','Wryan','Parr','wparr@eagles.ewu.edu',0),('00705745','Cory','Beck','cbeck7@eagles.ewu.edu',0),('00715879','Bryan','Caesar','bryancaesar@eagles.ewu.edu',0),('00716370','Danis','Terzi','DanisTerzi@eagles.ewu.edu',0),('00720081','Stanislav','Kozubenko','skozubenko@eagles.ewu.edu',0),('00720082','Svetlana','Kozubenko','skozubenko1@eagles.ewu.edu',0),('00720988','Brittney','Ray','bray9@eagles.ewu.edu',0),('00721561','Randy','Heckard','rheckard@eagles.ewu.edu',0),('00722401','Quinton','Tiller','qtiller@eagles.ewu.edu',0),('00724532','Nathan','Graham','ngraham4@eagles.ewu.edu',0),('00726158','Brent','Quackenbush','brentquackenbush@eagles.ewu.edu',0),('00727445','Mark','Rogers','mrogers21@eagles.ewu.edu',0),('00728052','Harikrisna','Patel','harikrisna.patel@eagles.ewu.edu',0),('00729221','Daniel','Paulson','daniel.paulson20@eagles.ewu.edu',0),('00730024','Jared','Smith','jsmith128@eagles.ewu.edu',0),('00730673','Kyle','Smith','ksmith114@eagles.ewu.edu',0),('00732729','Hewr','Tarkhany','htarkhany@eagles.ewu.edu',0),('00734828','Evo','Sokoloff-Toney','evolve95@eagles.ewu.edu',0),('00737175','Jerett','Latimer','jlatimer1@eagles.ewu.edu',0),('00737281','Brandyn','Bangsund','brandynbangsund@eagles.ewu.edu',0),('00740311','Emilio','Campos','emilio.campos@eagles.ewu.edu',0),('00740551','Sarah','Adkins','Ms.sarah.adkins@eagles.ewu.edu',0),('00743320','Stephanie','Russell','srussell6@eagles.ewu.edu',0),('00743512','Maria','Avalos Torres','mavalos5@eagles.ewu.edu',0),('00745190','Timothy','Bennett','tbennett4@eagles.ewu.edu',0),('00745919','Kayla','Rubin','krubin@eagles.ewu.edu',0),('00746427','Keith','Stack','kstack@eagles.ewu.edu',0),('00746688','Caleb','Stanley','cstanley2@eagles.ewu.edu',0),('00747069','Alyssa','Fitzgerald','afitzgerald@eagles.ewu.edu',0),('00747162','Chaz','Hurd','churd@eagles.ewu.edu',0),('00747275','Jose','Garcia','joseg253@eagles.ewu.edu',0),('00748492','Jennifer','Goodnight','jgoodnight@eagles.ewu.edu',0),('00748574','Daylyn','Hoxie','dhoxie@eagles.ewu.edu',0),('00750215','Andrew','Sales','asales@eagles.ewu.edu',0),('00751953','Richard','Lefebvre','rickyslefebvre@eagles.ewu.edu',0),('00752231','Steven','Richmond','srichmond@eagles.ewu.edu',0),('00752506','Aleksandr','Chernega','achernega@eagles.ewu.edu',0),('00752541','John','Burress','johnw.burress@eagles.ewu.edu',0),('00754435','Naji','Kaddoura','nkaddoura@eagles.ewu.edu',0),('00758161','Gabrielle','Pistoresi','gpistoresi@eagles.ewu.edu',0),('00760647','Mia','Hunt','mhunt12@eagles.ewu.edu',0),('00761221','Joseph','Gedeon','jgedeon@eagles.ewu.edu',0),('00762023','Ian','Oleson','ioleson@eagles.ewu.edu',0),('00762578','Conrad','Provan','cprovan@eagles.ewu.edu',0),('00768135','Robin','Deskins','adeskins@eagles.ewu.edu',0),('00773500','Tarren','Selig','Podrocker99@eagles.ewu.edu',0),('00774443','Noah','Brown','nbrown27@eagles.ewu.edu',0),('00774465','Jake','McGillicuddy','jmcgillicuddy@eagles.ewu.edu',0),('00775933','Steven','Zuelke','szuelke@eagles.ewu.edu',0),('00776019','Michael','Henderson','mhenderson@eagles.ewu.edu',0),('00778871','Aaron','Sauther','aaron.sauther@eagles.ewu.edu',0),('00779193','Michael','Kieburtz','mkieburtz@eagles.ewu.edu',0),('00782838','Alex','Corak','alex.corak@eagles.ewu.edu',0),('00786611','Victor','Vargas','vvargas4@eagles.ewu.edu',0),('00786973','Evan','Kelley','evan.kelley@eagles.ewu.edu',0),('00788655','Ira','Earl','iearl1@eagles.ewu.edu',0),('00788720','Michael','Cartwright','mcartwright1@eagles.ewu.edu',0),('00788821','Samuel','Nixon','snixon@eagles.ewu.edu',0),('00789932','Jacob','Stevens','jstevens5@eagles.ewu.edu',0),('00791044','Jesse','Ross','jross31@eagles.ewu.edu',0),('00791097','Raymond','Shiner','raymondshiner@eagles.ewu.edu',0),('00791262','Lisa','Faulkner','lfaulkner2015@eagles.ewu.edu',0),('00791561','Tu','Nguyen','tunguyen@eagles.ewu.edu',0),('00792937','Devin','Kramer','dkramer2@eagles.ewu.edu',0),('00796430','Austin','Hall','ahall38@eagles.ewu.edu',0),('00797831','Jaden','Fisher','jfisher16@eagles.ewu.edu',0),('00798356','Mark','Studor','mcstudor@eagles.ewu.edu',0),('00798522','Marcus','Goss','Marcus.Goss@eagles.ewu.edu',0),('00798677','Julian','Welge','jwelge1@eagles.ewu.edu',0),('00799553','Morgan','Combs','mcombs5@eagles.ewu.edu',0),('00799679','Mitchell','Fenton','mfenton5@eagles.ewu.edu',0),('00800585','Maxwell','Bergam','mbergam1@eagles.ewu.edu',0),('00800724','Eric','Adams','eadams16@eagles.ewu.edu',0),('00800830','Cooper','Wutzke','cwutzke@eagles.ewu.edu',0),('00802207','Bryn','Jones','bjones42@eagles.ewu.edu',0),('00802866','Cody','Kerkuta','ckerkuta@eagles.ewu.edu',0),('00803414','Katherine','Bozin','kbozin@eagles.ewu.edu',0),('00805308','James','Tollefsen','jtollefsen@eagles.ewu.edu',0),('00805653','Hollyanne','Sander','herbel.holly@eagles.ewu.edu',0),('00806509','Katherine','Walden','kwalden4@eagles.ewu.edu',0),('00807114','Bethany','Myers','bmyers15@eagles.ewu.edu',0),('00809142','Mark','Dietzler','mdietzler@eagles.ewu.edu',0),('00809183','James','Rider','jrider3@eagles.ewu.edu',0),('00809260','Clark','Rabe','crabe1@eagles.ewu.edu',0),('00811072','John','Petrovich','jpetrovich@eagles.ewu.edu',0),('00811872','Spencer','Metz','smetz@eagles.ewu.edu',0),('00814071','Jacob','Blazina','jblazina@eagles.ewu.edu',0),('00818407','Justin','Holcomb','jholcomb1@eagles.ewu.edu',0),('00818721','Kyle','Sewright','ksewright@eagles.ewu.edu',0),('00818813','Grigory','Ostanin','gostanin@eagles.ewu.edu',0),('00820006','Gabriel','Ries','gries@eagles.ewu.edu',0),('00820273','Jacob','Labudda','jlabudda@eagles.ewu.edu',0),('00823483','Colton','Somes','csomes@eagles.ewu.edu',0),('00824242','Graham','Mix','gmix@eagles.ewu.edu',0),('00824282','Anthony','Piccirillo','apiccirillo@eagles.ewu.edu',0),('00824395','Marie','Taylor','mtaylor30@eagles.ewu.edu',0),('00824436','Ryley','Horton','rhorton5@eagles.ewu.edu',0),('00825414','Angel','Bermudez','abermudez@eagles.ewu.edu',0),('00826552','Nikolas','Graham','ngraham6@eagles.ewu.edu',0),('00827258','Collin','Short','cshort4@eagles.ewu.edu',0),('00827750','Jessica','Jahn','jjahn2@eagles.ewu.edu',0),('00828252','Chester','Southwood','csouthwood@eagles.ewu.edu',0),('00828272','Freddy','Lopez','flopez8@eagles.ewu.edu',0),('00828855','Reuben','Hopper','rhopper1@eagles.ewu.edu',0),('00829735','Alexander','Spichak','aspichak@eagles.ewu.edu',0),('00829937','Firomsa','Abdurahman','fabdurahman@eagles.ewu.edu',0),('00830717','Nathan','Pruczinski','npruczinski@eagles.ewu.edu',0),('00831433','Luis','Mejia','lmejia2@eagles.ewu.edu',0),('00831785','Matthew','Firmin','mfirmin@eagles.ewu.edu',0),('00831938','Corbin','Smith','csmith157@eagles.ewu.edu',0),('00832358','Ronald','Robinson','rrobinsoniii@eagles.ewu.edu',0),('00832361','Igor','Svirgun','isvirgun@eagles.ewu.edu',0),('00833351','Rhianna','Quick','rquick2@eagles.ewu.edu',0),('00833384','Jason','Campbell','jcampbell18@eagles.ewu.edu',0),('00833794','Mark','Felchlin','mfelchlin1@eagles.ewu.edu',0),('00834314','Trenton','Harris','tharris22@eagles.ewu.edu',0),('00835796','Neriah','Graham','ngraham7@eagles.ewu.edu',0),('00836522','Kevin','Underwood','kunderwood1@eagles.ewu.edu',0),('00837320','Van','Nguyen','vnguyen22@eagles.ewu.edu',0),('00837566','Daniel','Tekle','dtekle1@eagles.ewu.edu',0),('00837694','Matthew','Montney','mmontney@eagles.ewu.edu',0),('00838381','Micah','Sandford','msandford@eagles.ewu.edu',0),('00838382','Elric','Krebs','ekrebs@eagles.ewu.edu',0),('00838607','Grady','Chiamulon','gchiamulon@eagles.ewu.edu',0),('00839659','Hunter','Rich','hrich2@eagles.ewu.edu',0),('00839729','Shea','Bryan','sbryan1@eagles.ewu.edu',0),('00840491','Damien','Rodriguez','drodriguez17@eagles.ewu.edu',0),('00841467','Alex','Yoho','ayoho@eagles.ewu.edu',0),('00841728','Calum','Mackenzie','cmackenzie@eagles.ewu.edu',0),('00842107','Matthew','Jenkins','mjenkins8@eagles.ewu.edu',0),('00842162','Colton','Estlund','cestlund@eagles.ewu.edu',0),('00842417','Jacob','Phillips','jphillips16@eagles.ewu.edu',0),('00843349','Justin','Ching','jching@eagles.ewu.edu',0),('00843433','Jonathan','Brown','jbrown133@eagles.ewu.edu',0),('00843997','Petal','Michaud','pmichaud1@eagles.ewu.edu',0),('00846988','Griffin','Foster','gfoster6@eagles.ewu.edu',0),('00847362','Abdulrahman','Alshamoosi','aalshamoosi@eagles.ewu.edu',0),('00848588','William','Turk','wturk1@eagles.ewu.edu',0),('00848671','Colton','Belfils','cbelfils@eagles.ewu.edu',0),('00850213','Anatoli','Railean','arailean@eagles.ewu.edu',0),('00852001','Suharto','Suharto','suharto@eagles.ewu.edu',0),('00853686','Christian','Silver','csilver4@eagles.ewu.edu',0),('00854656','Daniel','Knoll','dknoll1@eagles.ewu.edu',0),('00855412','Erik','Almaguer','ealmaguer@eagles.ewu.edu',0),('00855585','Brian','Bach','bbach2@eagles.ewu.edu',0),('00855923','Kobe','Kupp','kkupp2@eagles.ewu.edu',0),('00855930','Mohammed','Alyami','malyami@eagles.ewu.edu',0),('00856621','Eleazar','Contreras-flores','econtrerasflores@eagles.ewu.edu',0),('00857780','Brenden','Cline','bcline4@eagles.ewu.edu',0),('00858728','Joshua','Stewart','jstewart13@eagles.ewu.edu',0),('00859429','Matthew','Myrick','mmyrick@eagles.ewu.edu',0),('00860772','Ryan','McLemore','rmclemore@eagles.ewu.edu',0),('00860827','Khanh','Luu','kluu@eagles.ewu.edu',0),('00860978','Tyler','Rettkowski','trettkowski@eagles.ewu.edu',0),('00861401','Noah','Thompson','nthompson7@eagles.ewu.edu',0),('00861687','Tam','Nguyen','tnguyen72@eagles.ewu.edu',0),('00861805','Travis','Cartmell','tcartmell@eagles.ewu.edu',0),('00862105','Daniel','Powers','dpowers9@eagles.ewu.edu',0),('00862422','Travis','Morton','tmorton5@eagles.ewu.edu',0),('00862508','Nicholas','Shubin','nshubin@eagles.ewu.edu',0),('00862608','Ryan','Bucherl','rbucherl@eagles.ewu.edu',0),('00863328','Pavel','Trubchik','ptrubchik@eagles.ewu.edu',0),('00863332','Kevin','Mullins','kmullins2@eagles.ewu.edu',0),('00863485','Karan','Dudani','kdudani@eagles.ewu.edu',0),('00864050','Kiana','Norton','knorton4@eagles.ewu.edu',0),('00864163','Isaiah','Weaver','iweaver1@eagles.ewu.edu',0),('00864761','Max','Iniguez','miniguez2@eagles.ewu.edu',0),('00864955','Luke','Mattfeld','lmattfeld@eagles.ewu.edu',0),('00865390','Mia','Smith','msmith173@eagles.ewu.edu',0),('00865418','Rachael','Deboer','rdeboer@eagles.ewu.edu',0),('00866912','Robert','Moreno','rmoreno2@eagles.ewu.edu',0),('00867467','Brian','Jackson','bjackson10@eagles.ewu.edu',0),('00868231','Julia','Nelson','jnelson38@eagles.ewu.edu',0),('00868563','Zainab','Al Dawood','zaldawood@eagles.ewu.edu',0),('00868824','Kolby','Stalter','kstalter@eagles.ewu.edu',0),('00868924','Pavel','Chernichenko','pchernichenko@eagles.ewu.edu',0),('00868935','Terrance','Cunningham','tcunningham2@eagles.ewu.edu',0),('00869184','Md Abul','Kashem','mkashem@eagles.ewu.edu',0),('00869654','Halim','Acosta','hacosta1@eagles.ewu.edu',0),('00870215','Yousef','Baghlaf','ybaghlaf@eagles.ewu.edu',0),('00870694','Andrew','Mitchell','amitchell12@eagles.ewu.edu',0),('00871388','Vernice','Keyes','vkeyes@eagles.ewu.edu',0),('00872491','Richard','Phelps','rphelps2@eagles.ewu.edu',0),('00873694','David','Sergio','dsergio@eagles.ewu.edu',0),('00876021','Ryan','Serghini','rserghini@eagles.ewu.edu',0),('00876144','Caleb','Walsh','cwalsh13@eagles.ewu.edu',0),('00877202','Tyler','Bassett','tbassett1@eagles.ewu.edu',0),('00877318','Justin','Cyr','jcyr@eagles.ewu.edu',0),('00878721','Joshua','Lini','jlini1@eagles.ewu.edu',0),('00880260','Nicholas','Leavey','nleavey@eagles.ewu.edu',0),('00881272','Mason','Guerdette','mguerdette@eagles.ewu.edu',0),('00881540','Jesse','Anderson','janderson53@eagles.ewu.edu',0),('00882149','Alex','Thornton','athornton4@eagles.ewu.edu',0),('00884801','Mamdouh','Zayed','mzayed@eagles.ewu.edu',0),('00885810','Bradley','Armstrong','barmstrong7@eagles.ewu.edu',0),('00885852','Micah','Johnson','mjohnson79@eagles.ewu.edu',0),('00889472','Vladimir','Shingarey','vshingarey@eagles.ewu.edu',0),('00891529','Spencer','Curley','scurley2@eagles.ewu.edu',0),('00891860','Jun Yu','Teoh','jteoh@eagles.ewu.edu',0),('00891881','Jordan','Fischer','jfischer5@eagles.ewu.edu',0),('00892986','Jonathyn','Komorita','jkomorita@eagles.ewu.edu',0),('00895269','Jason','Stanley','jstanley3@eagles.ewu.edu',0),('00897833','Nicole','Livingston','nlivingston1@eagles.ewu.edu',0),('00898793','Alejandro','Camacho','acamacho6@eagles.ewu.edu',0),('00899128','Jacob','Erdman','jerdman2@eagles.ewu.edu',0),('00899308','Joel','Kalich','jkalich@eagles.ewu.edu',0),('00902943','Jeffrey','Nix','jnix1@eagles.ewu.edu',0),('00904365','Jackson','Newland','jnewland1@eagles.ewu.edu',0),('00907799','James','Hitchman','jhitchman@eagles.ewu.edu',0),('00913217','Kayla','Foremski','kforemski@eagles.ewu.edu',0),('00921419','Mario','Cabrera','mcabrera3@eagles.ewu.edu',0),('00921490','Anthony','Hirt','ahirt1@eagles.ewu.edu',0),('00921972','Chris','Dobbins','cdobbins1@eagles.ewu.edu',0),('999999','System','System','system@ape',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-12  3:00:01
