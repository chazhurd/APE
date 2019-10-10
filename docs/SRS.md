# APE MANAGEMENT SYSTEM
Software Requirement Specifications

Originally: Pavandeep K Bolena, Justyn Jones, Jordan Sampilo
TEAM 1: APE Continuation

## Table of Contents
### SOFTWARE REQUIREMENT SPECIFICATIONS

1. INTRODUCTION
    1. PURPOSE
    2. DOCUMENT CONVENTIONS
    3. INTENDED AUDIENCE
    4. PROJECT SCOPE
    5. REFERENCES

2. OVERALL DESCRIPTION
    1. PRODUCT PERSPECTIVE
    2. USER CLASSES AND CHARACTERISTICS
    3. OPERATING ENVIRONMENT
    4. DESIGN AND IMPLEMENTATION CONSTRAINTS
    5. ASSUMPTIONS AND DEPENDENCIES

3. ACCOUNT FEATURES
    1. ACCOUNT DESCRIPTIONS
    2. STUDENT
        1. FUNCTIONALITY
        2. REGISTRATION FOR APE
        3. STUDENT HOMEPAGE
    3. GRADER
        1. FUNCTIONALITY
        2. GRADING AN APE
    4. TEACHER
        1. FUNCTIONALITY
        2. CREATING AND GRADING AN APE
        3. RESTRICTED ADMINISTRATIVE RIGHTS
    5. ADMINISTRATOR
        1. FUNCTIONALITY
        2. CREATING AN APE
        3. CREATING ACCOUNTS
        4. CREATING/REGISTERING INDEPENDENT STUDENT
        5. FINALIZING GRADES
        6. REPORTS
4. GRADES
5. STATES
    1. EXAM STATES
        1. HIDDEN
        2. OPEN FOR REGISTRATION
        3. IN PROGRESS
        4. GRADING
        5. ARCHIVED
    2. STUDENT STATES
        1. READY TO REGISTER
        2. REGISTERED
        3. BLOCKED
        4. PASSED
6. EXTERNAL INTERFACE REQUIREMENTS
    1. HARDWARE INTERFACES
    2. SOFTWARE INTERFACES
    3. USER INTERFACES
    4. COMMUNICATION INTERFACES
7. NON-FUNCTIONAL REQUIREMENTS
    1. SECURITY REQUIREMENTS

## Introduction

### 1.1 Purpose
This SRS documents all the requirements and necessary information for what our team will produce as
the Advancement Programming Exam (APE) Management System. It will explain in detail, the features,
interfaces, and the overall workings of the system. This SRS is intended for use by any future groups who
wish to improve upon the system.

### 1.2 Document Conventions
The requirements listed in this document are intended to be fulfilled and in production by the final
iteration.

### 1.3 Intended Audience
This documentation’s intended audience are Tom Capaul, Stu Steiner, Dan Tappan, Connie Bean, and
faculty of EWU’s Computer Science department. It also is intended for future groups responsible for
improving this software.

### 1.4 Project Scope
The scope of this project pertains to the APE Management System software’s specifications and
requirements. The software we develop will be intuitive and simple for any intended users. It will allow
students to register for APEs, unregister for APEs, and view their grades once they’ve been completed.
The software will allow graders to submit and edit grades unbiasedly for said exams. It will also allow
teachers to do their own APE for their CSCD 211 classes; they will be able to upload their student roster
to automatically register the whole class, and grade the APEs. Admins will be permitted to manually add
and remove all types of accounts, view grades, publish exams, and generate reports.

### 1.5 References
The current version of this software which this project intends to improve and replace can be found
through the following URL: https://ape.compsci.ewu.edu/phpAPE/

## Overall Description

### 2.1 Product Perspective
The APE Management System is revamp of the previous software with intentions of being more
intuitive, more secure, well defined, and complete. It will provide our clients and EWU faculty a fluid
interface in which they can administer the APE in a smooth manner.

### 2.2 User Classes and Characteristics
Student:

A student will login to the system using SSO, view available exams,
register and unregister as needed, and view their test score.

Grader:

A grader will submit grades for completed APEs that are assigned to
them and enter them into the system. The grader will be able to edit
already submitted grades while the exams are in “grading” state.

Teacher:

A teacher will be able to upload a file containing their class roster
and instantaneously register their entire class for an APE. The APE
will be created and graded by the teacher or specified graders.

Admin:

The admin will have complete control of the entire system and will
be permitted to, create/edit/archive exams, add/remove exam
locations, manually add/remove accounts of any type, and generate
reports. There can be a maximum 2 of this type of account.

### 2.3 Operating Environment
OE-1:

The system will have compatibility with Microsoft Internet Explorer,
Microsoft Edge, Google Chrome, Mozilla Firefox, and Apple Safari.

OE-2:

The system will operate on a development server provided by the
Computer Science Department with the following environment
configuration:
PHP 5.6.x
Apache 2.4.x
MariaDB 10.1.x

OE-3:

The system will allow user access through any internet connected
computer.

2.4 Design and Implementation Constraints
CO-1:

The system shall use MariaDB 10.1.x as its database.

CO-2:

The scripts written for the system shall be in PHP 5 or JavaScript with
jQuery library usage.

CO-3:

All HTML files involved in the system shall be compatible with current
XHTML versions.

2.5 Assumptions and Dependencies
AS-1:

It can be assumed that there will be no more than two administrator
accounts and a minimum of one at all times.

AS-2:

It can be assumed that four grader accounts minimum will meet the
needs of the client. Two different sets of eyes per two categories.

AS-3:

It can be assumed that a production server that meets the needs and
specifications mentioned prior will be available for the deployment of the
final product.

DE-1:

The system is dependent on a consistent internet connection in which the
server is connected to.

DE-2:

The system is dependent on multiple types of tools such as, PHP,
JavaScript, MariaDB, and Apache.

DE-3:

The system is dependent on a database server, in which information will
be stored and retrieved from.

## Account Features

### 3.1 Account Descriptions
There will be four different account types: student, grader, teacher, and administrator. Once a user logs
into the system using their SSO, they will be redirected to a page where they are asked to select what
account type they will proceed as. The account types they can choose from will be dependent on their
EWU ID and the associated accounts. Therefore if a user has several account types associated with their
EWU ID, they are forced to use one at a time.

### 3.2 Student
The student account type is intended for students who plan on taking the APE at Eastern Washington
University. The student will be instructed to log in with their Single-Sign-On accounts allowing the
system access to their EWU account information (EWU ID number, EWU email, etc.).
If the student is logging in for the first time, the system will add them to the Student Table in the
Database.

#### 3.2.1 Functionality
The student account will be capable of doing the following:




Register for an APE
- Students will be able to register for any of the APEs available to them.

Unregister for an APE
- Students will be able to unregister for any APE that they are registered for.

View their grade for an APE
- Students will be notified once grades for a specific APE are posted.
- Students will be able to log into their account and view their grade for any APE they have taken.

#### 3.2.2 Registration for APE
Once a student account type logs in, the system will automatically redirect them to the Student
Homepage. On this page the student can choose to register for an available APE. Once the student is
registered for the APE, the system will send them an email to their EWU email account confirming their
selection with details about the APE.
Once the date of the APE comes closer, the student will get a reminder email from the system with
location and time information for the APE they have signed up for.

#### 3.2.3 Student Homepage
Once the student account type has logged in and been redirected to the Student Homepage, they will be
able to view current APEs that are available for registration, previous APEs and scores, and APEs they are
currently registered for.
On the homepage, they will also have access to the APE coordinator’s contact information as well as
download links for practice/previous APEs.

### 3.3 Grader
The grader account type is intended for a faculty member within the Computer Science Department that
will be grading an APE. The account will be created by the Admin with a username and password that is
to be assigned to a grader. The grader will grade APEs by seat numbers. No names or personal
information will be visible to the grader to help keep grading impartial.

#### 3.3.1 Functionality
The grader account will be capable of the following:

Viewing APEs assigned to them
- Graders will only be able to access and grade APEs that the Administrator account or a teacher account has assigned to them.

Grading an APE
- The grader will have access to all the seat numbers associated with a given APE.

Submitting Scores
- The Grader will be able to enter and save scores for APEs assigned to them.
- Once an APE is fully graded and submitted to the Admin, the grades cannot be edited by the grader.

#### 3.3.2 Grading an APE
When the grader is ready to grade an APE that is assigned to them, they will click on the APE and see a list of seats.
Each seat will be associated with an APE that was taken by the student sitting at that assigned seat.
Every grader will be assigned certain categories for a given APE.
There will be a max number of points that can be given in each category that will be set by the account type that created the APE (Teacher or Administrator).
This max number of points cannot be exceeded by the grader and the grader cannot submit scores below 0.
Once the grader is ready to submit the grades, they will submit them to the account that created the specified APE and the exam will no longer be visible to the grader.
This will return them to their homepage which shows them the APEs that are assigned to them that still need to be submitted.
The following label colors indicating the following grading states:
- Grading Not Started
- Grading in Progress
- The grader has not yet entered any grades for this APE.
- The grader has started entering grades for this APE but has not yet submitted the exam.

### 3.4 Teacher
The teacher account type is intended for professors in the department that teach CSCD 211 classes.

#### 3.4.1 Functionality
The teacher account will be capable of the following:

- Creating an APE

This APE will only be visible to the teacher that created the APE, assigned graders at the
appropriate state, and the administrator.
No students will have access to this APE.
- The teacher that creates this APE will also have the ability to grade it and add/remove students from it.
Upload list of students to auto register them for created APE
- Teachers will be able to submit a .csv file to the system with the following information in
order:
- EWU ID number
- Last Name, First Name
- EWU Email Address
- The system will then be able to register these students for the APE created by the
teacher.

#### 3.4.2 Creating and Grading an APE
The teacher will have the ability to create an APE specifically for their class. They will be able to
choose/add different categories, specify graders for each category, the max number of points that can
be given in each category, and the ability to override any state that the system automatically gives the
created APE.
The teacher can grade the APE they create.
The system will treat the teacher’s grades the same as a grader’s grades.
The system will make sure that all the grader’s and teacher’s scores difference is within a certain range (set by the APE creator).
If the difference is not within that range, the system will flag the seat number and require administrator attention.
The system will finalize the score and it will be visible to only the teacher and administrator.

#### 3.4.3 Restricted Administrative Rights
The teacher will have very similar rights when it comes to creating an APE, viewing grades for an APE created by them, and finalizing scores when compared to an administrator account type.
The teacher will be able to make edits to final pass/fail grades if the student’s final score puts them in the “Under Review” state.
The administrator has the ability to override any decisions made by the teacher when it comes to grades and passing/failing students.
Once the administrator makes edits, the teacher cannot reverse those changes.

### 3.5 Administrator
There can only be a maximum 2 of this account type. With this account, the user has ultimate control
over the whole system and can override any system or other account type actions.

#### 3.5.1 Functionality

The administrator account will be capable of the following:
- Look up students, graders, and teachers accounts
- The system will display the results sorted by account type.
- Add users for any of the account types (except administrator account type) to the APE database
- Edit any account information or state of an account

When a student account has completed and passed an APE, the system will put them in
the “Not Allowed to Register” state. This account type is able to override this and
change the state for the account.
View archived APEs
- This account type will be able to look up past APEs that have been archived and see all
the following information:
    - Students who took that APE
    - Scores for the APE
    - Information about the location, duration, and categories
    - Graders that were assigned to the APE and the grades they gave

Upload APEs for students to practice
- Upload APEs to the student homepage with downloadable links for students to access.
Add, edit, and remove category types
- These categories will be available for teacher accounts to use when they are creating
their APEs.
- The max number of points possible will be set by the administrator at APE creation.
    - Max number of points will not be linked to categories.
- There will be default options like the following:
    - “Default APE Categories”
    - “Stu’s 211 Class”

Add, edit, and remove locations
- This account type will be able to create, edit, or remove different locations where the APEs can be held.
- Create an APE
- Generate Reports
- Pass/Fail students manually
- Register/Unregister Students for an APE

#### 3.5.2 Creating an APE
The administrator will have the ability to create APEs that students are able to register for. The
administrator will be able to add/modify the following features of an APE:
- Start time
- Duration
- Location
- Categories
- State
- Graders

When a crucial part of the APE is modified and students have already registered for the APE, the system
will send them an email with the updated APE information.

#### 3.5.3 Creating Accounts

The administrator will be able to create and add the following accounts to the APE database:
- Students
- Graders
- Teachers

#### 3.5.4 Creating/Registering Independent Student
This account type will also be able to create an independent student with no EWU ID and/or EWU email.
The system will allow only the administrator to do this.
This student type is intended for students transferring to EWU that do not yet have their EWU credentials but have completed the required prerequisites to take the APE.
Once this student account is created, the account will be able to have the same functionality as a regular student account.
The only difference is that they will not sign in to the site until the administrator has added their EWU ID and email to their associated account.
The account will instead have the student’s personal email until it is changed by the administrator.
Once this student is created by the administrator, the administrator can register them for an APE.

#### 3.5.5 Finalizing Grades
This account type will be able to pass or fail a student regardless of their score or any scores given by the graders.
A student that lands in a certain range (set by the administrator during ape creation) will be put into an “Under Review State”.
Once the final grade decision has been made by the administrator, they can pass/fail a student regardless of any grade they are given.
When manually passing or failing a student, the administrator will be required to add a comment in the provided comment box specifying why the final grade was given.
This comment can be hidden or visible to the student depending on the administrator.

#### 3.5.6 Reports
This account type will have the ability to create, view, and download reports from the system. The
system will be able to generate reports with the information specified by the administrator.
There will be default report options that the administrator can select like the following:

- Pass/Fail report
    - For a given APE with students’ EWU IDs and EWU emails Students Registered
    - A list of students who are registered for a given APE with their names, EWU ID numbers, and email
- The administrator will be able to add report types and specify what information they want the report to include (names, IDs, emails, addresses, phone numbers, scores, pass/fail, attempts, assigned seats).
- Grades

Once grades are submitted by the graders, the system will calculate whether the margin of difference between the different grades given is within a range specified by the APE creator.
Depending on the results, the system will pass/fail the student, or flag the student for administrator review.
Before the grades are published, the administrator will need to do a final review of the grades and change the state of the APE to “Archived”.

### 5.1 Exam States

#### 5.1.1 Hidden
The exam is in the database and ready, however students may not view or register for the APE in this
state.

#### 5.1.2 Open for Registration
Students are able to view and register for the APE during this time. The state of the exam will move to
this state automatically based on when the admin sets it upon creation of the exam.

#### 5.1.3 In Progress
Students are no longer able to register for the APE during this time. The state of the exam will move to
this state automatically based on the time the exam was set to take place.

#### 5.1.4 Grading
The graders are able to view and grade the APE. The state of the exam will move to this state
automatically when the exam time is over.

#### 5.1.5 Archived
The students can view their grade on the website. This state must be manually moved to by the admin
when the grades are finalized.

### 5.2 Student States
#### 5.2.1 Ready to Register
The student can register for an APE.

#### 5.2.2 Registered
The student is registered and ready to take an APE at the specified time. The student moves to this state
after registering for an APE. The student cannot register for multiple APEs.

#### 5.2.3 Blocked
The student has a block on their account. The student cannot register for an APE. The admin is the only
user that can change the student’s state. The student is automatically moved to this state after failing
three or more APEs or upon administrator request.

#### 5.2.4 Passed
The student has passed an APE. The student can no longer register for another APE. The student
automatically moves to this state after passing an APE. The administrator is the only user that can
change the student’s state.

## External Interface Requirements

### 6.1 Hardware Interfaces
The system will live on a web server owned by Eastern Washington University.

### 6.2 Software Interfaces
The server will be an Apache 2.4.x web server. The web pages will be written using PHP 5.6.x along with
JavaScript with the jQuery library
The system will use a MariaDB 10.1.x server to store use information and grades.
The system will use Eastern Washington University’s SSO to get student information.

### 6.3

## User Interfaces

The system will be accessed via webpage by students, graders, teachers, and administers.

### 6.4 Communication Interfaces
Clients will connect to the system’s website using a web browser. The system will compatible with
Internet Explorer, Microsoft Edge, Google Chrome, Mozilla Firefox, and Apple Safari.

## Non-Functional Requirements

### 7.1 Security Requirements
SR-1:
SR-2:
SR-3:
SR-4:
SR-5:

All passwords will be encrypted using SHA-3.
Passwords are never an output from the database.
The student that is being graded will be kept hidden from the grader.
Any user must log in before performing any action.
No student may view any other student’s data.
