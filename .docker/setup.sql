
CREATE USER 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';

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
