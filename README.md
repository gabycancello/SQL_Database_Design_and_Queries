Database Management and SQL Exercises

This repository contains a collection of SQL exercises focused on database design, data manipulation, and advanced querying techniques. The exercises simulate real-world use cases, such as university and college systems, to demonstrate SQL operations such as database creation, table structures, and querying for specific data insights.

Repository Overview

The repository is organized into multiple folders, each containing exercises related to different aspects of MySQL database management. The exercises cover topics from creating and structuring databases to complex queries involving data filtering, aggregation, and relational integrity.

Folder Breakdown
	1.	Activity 1: University Database
	•	Focuses on simulating a university database for managing students, courses, professors, classes, and student grades.
	•	Examples of exercises:
	•	Query to find students with grades below 5 in a specific course.
	•	Calculate the average grades of students in a particular course.
	•	Retrieve a list of students who are not from the same city.
	2.	Activity 2: College Database
	•	This section demonstrates a college management system that handles student data, professor details, class schedules, and department information.
	•	Exercises include:
	•	Data insertion and table creation for college-related entities.
	•	Altering table structures to match changing requirements (e.g., increasing field sizes).

How to Use
	1.	Clone the Repository:

git clone https://github.com/your-username/repository-name.git


	2.	Import Database Scripts:
	•	Set up your MySQL database and run the scripts from the appropriate folders to create tables and insert sample data. For example:

source /path/to/Activity1_script.sql;


	3.	Querying the Data:
	•	Once the data is inserted, you can execute the SQL queries provided in the exercises to interact with the data. For example:

-- Find students who have a grade lower than 5 in the Database course
SELECT mat FROM tbl_historico WHERE cod_disc = 'BD' AND ano = '2015' AND nota < 6;


	4.	Learning Outcomes:
	•	Gain hands-on experience in designing relational databases.
	•	Practice writing SQL queries to manipulate and extract data.
	•	Explore different scenarios such as data aggregation, foreign key relationships, and database integrity.

Technologies Used
	•	MySQL Database
	•	SQL (Structured Query Language)
	•	Relational Database Management Systems (RDBMS)

Contributions

Feel free to contribute by opening pull requests or submitting issues related to database structures, queries, or additional exercises.

License

This project is licensed under the MIT License.s licensed under the MIT License.
