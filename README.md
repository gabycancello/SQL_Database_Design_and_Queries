Database Management and SQL Exercises

This repository contains practical examples of database manipulation using MySQL. The scripts range from creating databases and tables to advanced SQL queries for data manipulation and analysis. The focus is on demonstrating SQL usage in typical system scenarios, such as university and college management.

Repository Structure

The repository is organized into several folders, each containing a set of exercises and examples related to database creation and manipulation. The folders include SQL scripts for creating tables, inserting data, and executing queries.

Folders:
	1.	Activity 1 - University Database
	•	Contains scripts for creating tables that involve students, courses, professors, classes, and historical records.
	•	Example queries:
	•	Query students with a grade lower than 5 in the Database course.
	•	Calculate the average grades of students in a specific course.
	•	Filter students from outside a specific city.
	2.	Activity 2 - College Database
	•	Scripts for creating tables for students, professors, classes, and departments.
	•	Contains examples of data manipulation, such as inserting records and altering fields.

How to Use
	1.	Clone the repository:

git clone https://github.com/your-username/repository-name.git


	2.	Import the SQL Scripts into Your Database:
	•	Access MySQL and create a new database to import the scripts.
	•	Execute the database creation and table scripts.

source /path/to/script.sql;


	3.	Run the SQL Queries:
	•	After importing the data, you can run the SQL queries included in the scripts to manipulate or query the data inserted into the tables.
	4.	Example Query Execution:
	•	After running the database creation and data insertion scripts, you can execute the following queries:

-- Query students with grades lower than 5 in Database course
SELECT mat FROM tbl_historico WHERE cod_disc = 'BD' AND ano = '2015' AND nota < 6;



Technologies Used
	•	MySQL
	•	SQL (Structured Query Language)
	•	Relational databases

Contributions

If you’d like to contribute to this repository, feel free to submit pull requests or report any issues you find.

License

This project is licensed under the MIT License.

This version of the README provides the same structure and information in English, making it accessible to a broader audience, such as potential recruiters or collaborators.
