-- Database is  collection of data in a format that can be easily accessed (Digital)
-- A software application used to manage our DB is called DBMS (Database Management System)
/*
 TYPES OF DATABASES
 - rational(RDBMS) --  MySQLl,sql server, oracle and postgreSQL
 - non-relatonal(No SQL) -- mangoDB
*/
/*
======SQL======
- structured query language
- is aprogramming language used to interact with relational databases.

- it is used to perform CRUD operatins
- CREATE
- READ
- UPDATE
- DELETE
*/

/*
=========TABLE=========
- column -- structure/scheme(design)
- row -- indivitual data is stored
*/

/*
Creating our First Databases
- our fisrt sql query
CREATE DATABASE db_name;
- to create a database in sql
DROP DATABASE db_name;
- to delete the database in sql
*/

CREATE DATABASE college;
CREATE DATABASE IF NOT EXISTS college;

CREATE DATABASE makka;
drop database makka;
DROP DATABASE IF EXISTS makka;


USE college;

/*
======CREATING OUR FIRST TABLE=======

USE db_name(college);

CREATE TABLE table_name(
column name1 data type constraint,
column name2 data type constraint,
column name3 data type constraint
);
*/
CREATE TABLE student (
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);

SELECT * FROM student;

INSERT INTO student VALUES(1, "hari", 23);
INSERT INTO student VALUES(2, "nath", 26);
INSERT INTO student VALUES(3, "makka", 25);

SELECT * FROM student;

/* 	SQL DATATYPES
- DEFINE TYPE OF VALUES THAT CAN STORE IN A COLUMN
CHAR - CAN STORE CHARACTER OF FIXED LENGHT -              CHAR(50),
VARCAHR - CAN STORE CHARACTER UP TO GIVEN LENGHT -        VARCHAR(50),
BLOB - can store binary large object -                    BLOB(1000),
INT- integer -                                            INT,
TINYINT - integer -                                       TINYINT,
BIGINT - integer -                                        BIGINT,
BIT - can store x bit values. x can be range for 1 - 64 - BIT(2),
FLOAT - decimal number with precesion to 23 digits -      FLOAT,
DOUBLE - decimal number with 24 to 53 digits -            DOUBLE,
BOOLEAN - boolean values 0 or 1 -                         BOOLEAN,
DATE - date in formate YYYY-MM-DD -                       DATE,
YEAR - year in 4 digit format -                           YEAR.
*/

/*
=============SQL DATATYPES============= 
- SIGNED -- e.g. TINYINT(-128 TO 127)
- UNSIGNED -- e.g. TINYINT UNSIGNED(0 TO 255) -- when we need only +ve integers
*/

/*
================TYPES OF SQL COMMANDS=================
- DDL (Data Definition Language)     : create, alter, rename, truncate & drop
- DQL (Data Query Language)          : select
- DML (Data Manipulation Language)   : , insert, update & delete
- DCL (Data Control Language)        : grant & revoke permission to users
- TCL (Transaction Control Language) : start transaction, commit, rollback etc.
*/

 /*
=================Database related Queries================
- CREATE DATABASE db_name;
-- CREATE DATABASE IF NOT EXISTS db_name:
- DROP DATABASE db_name;
-- DROP DATBASE IF EXISTS db_name
- SHOW DATABASES; -- display all databases names
- SHOW TABLES; -- dispaly all tables list
 */

SHOW DATABASES;
SHOW TABLES;

DROP TABLE student;

CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50)
);

/*
===========SELECT * FROM==============
- to select and view all columns
- SELECT - to select 
- * -- all
- FROM table_name - choose table to access
*/
SELECT * FROM student;

/*

*/

INSERT INTO student
(rollno, name)
VALUES
(101,"hari"),
(102, "nath"),
(103, "makka");

INSERT INTO student
VALUES (104, "nandhu");

SELECT * FROM student;

CREATE DATABASE hari_company;
USE hari_company;

======PRACTICE=======
 CREATE TABLE employee_info (
 id INT PRIMARY KEY,
 name VARCHAR(50),
 salary INT NOT NULL
 );
 
 INSERT INTO employee_info VALUES
 (1, "hari", 20000),
 (2, "nari", 30000),
 (3, "maari", 25000);
 
 SELECT * FROM employee_info;

/*
============KEYS==============
PRIMARY KEY
- it is a column (or set of column) in a table that uniquely identifies each row. (a unique id)
- there is only 1 pk & it should be NOT null

FOREIGN
- A foreign key is a column (or set of columns) in a table that refers to the primary key in another table.
- There can be multiple FKs.
- FKs can have duplicate & null values.
*/

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, Name, Email) VALUES
(1, 'Alice Johnson', 'alice@example.com'),
(2, 'Bob Smith', 'bob@example.com'),
(3, 'Charlie Brown', 'charlie@example.com');

INSERT INTO Orders (OrderID, OrderDate, CustomerID) VALUES
(101, '2025-05-01', 1),  -- Order by Alice
(102, '2025-05-02', 2),  -- Order by Bob
(103, '2025-05-03', 1),  -- Another order by Alice
(104, '2025-05-04', 3);  -- Order by Charlie

SELECT * FROM Customers;

SELECT * FROM Orders;

/*
===============CONSTRAINS============
SQL constraints are used to specify rules for data in a table
- NOT NULL -- columns cannot have a null value
- UNIQUE -- all values in column are different and can be null
- PRIMARY KEY -- makes a column unique & not null but used only for one
- DEFAULT -- gives default same value to that column
- CHECK -- limit values allowed in a column
*/

CREATE TABLE temp1(
id INT,
name VARCHAR(50),
age INT,
city VARCHAR(50),
PRIMARY KEY (id, name)
);



INSERT INTO temp1 VALUES(1, "HARI",23,"HYD"),
(1, "CHANDHU", 25, "CNI"),
(2, "CHANDHU", 32, "BNG");

INSERT INTO temp1 values(3, "HARI", 45, "hyd");

SELECT * FROM temp1;

DROP TABLE temp1;

-- ============DEFAULT===========
CREATE TABLE employee(
id INT PRIMARY KEY,
salary INT DEFAULT 5000
);
 INSERT INTO employee (id) VALUES(1);
 SELECT *FROM employee;
 
-- ============CHECK==========
-- First, run this SELECT by itself
SELECT * FROM employee;

-- Then, separately create the table
CREATE TABLE city (
    id INT PRIMARY KEY,
    city VARCHAR(50),
    age INT,
    CONSTRAINT age_check CHECK(age >= 18 AND city = 'delhi')
);

INSERT INTO city (id, city, age) VALUES
(1, 'delhi', 19),
(2, 'delhi', 30),
(3, 'delhi', 18);

USE college;

drop table student;

CREATE TABLE student ( 
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL, 
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student(rollno, name, marks, grade, city)VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

 
/*
===========SELECT============
BASIC SYNTAX
- SELECT col!< col@ FROM table_name;

TO SELECT ALL
- SELECT * FROM table_name
*/

SELECT * FROM student; -- FOR ALL VALUES

SELECT name, grade FROM student; -- FOR SELSECTED  VALUES

SELECT DISTINCT city FROM student; -- show only unique values not repeated the values

/*
==================WHERE CLAUSE===================
TO DEFINE SOME CONDITIONS
- SELECT col1, col2 FROM table_name WHERE condition;

USING OPERATORS
- ARTHEMATIC : (+, -, *, /, %)
- COMPARISION : (=, !=, <, <=, >, >=)
- Logical Operators : AND, OR , NOT, IN, BETWEEN, ALL, LIKE, ANY
- Bitwise Operators : & (Bitwise AND), | (Bitwise OR)
*/

SELECT * FROM student
WHERE marks > 50;

SELECT name, marks FROM student
WHERE city = "delhi";

SELECT * FROM student WHERE marks+10 > 100;

SELECT * FROM student WHERE marks = 93;

SELECT * FROM student WHERE marks != 93;

/*
==========OPERATORS==========
AND
- TO CHECK FOR BOTH CONDITIONS TO BE TRUE.
OR
- TO CHECK ANY ONE CONDITIONS TO BE TRUE. 
BETWEEN
- SELECTED FOR A GIVEN RANGE.
IN
- MATCHES ANY VALUE IN THE LIST.
NOT IN
- TO NAGATE THE GIVEN CONDITION.
*/

SELECT * FROM student WHERE marks > 50 AND city = "mumbai";

SELECT * FROM student WHERE marks < 50 OR city != "mumbai";

SELECT * FROM student WHERE marks BETWEEN 80 AND 100;

SELECT * FROM student WHERE city IN ("delhi", "mumbai", "HYD");

SELECT * FROM student WHERE city NOT IN ("delhi", "hyd");

/*
=========LIMIT CLAUSE========
SETS AN UPPER LIMIT ON NUMBER OF (TUPLES) ROWS TO BE RETURNED
- SELECT col1, col2 FROM table_name LIMIT number(int);
*/

SELECT * FROM student LIMIT 3;

SELECT name, grade FROM student WHERE marks > 90 LIMIT 1;

SELECT * FROM student WHERE marks > 100 LIMIT 1;

SELECT MAX(marks) FROM student;

SELECT name, marks FROM student where marks > 90 limit 2;

SELECT name, marks FROM student WHERE marks = (SELECT MAX(marks) FROM student); 

select MIN(marks) from student;

SELECT name, marks FROM student WHERE marks = (SELECT MIN(marks) FROM student);

/*
========ORDER BY==============
TO SORT IN ASCENDING(ASC) OR DESCENDING (DESC) ORDER 
- SELECT * FROM table_name ORDER BY col_name(s) ASC;
*/

SELECT * FROM student ORDER BY city desc;

SELECT * FROM student ORDER BY city ASC LIMIT 2;

SELECT name FROM student order by city;

/*
Aggregate Functions
Aggregare functions perform a calculation on a set of values, and return a single value.
COUNT( )
MAX( )
MIN( )
SUM( )
AVG( )
*/

SELECT MAX(marks) FROM student;
SELECT MIN(marks) FROM student;
SELECT AVG(marks) FROM student;
SELECT COUNT(name) FROM student;
SELECT SUM(marks) FROM student WHERE rollno IN (101, 102);

/*
================Group By Clause=============

Groups rows that have the same values into summary rows.
It collects data from multiple records and groups the result by one or more column.

*Generally we use group by with some aggregation function.
*/

SELECT city, COUNT(name) FROM student GROUP BY city;

SELECT city, name , COUNT(name) FROM student GROUP BY city, name;

SELECT city FROM student GROUP BY city;

SELECT city, AVG(marks) FROM student GROUP BY city;

SELECT grade, COUNT(city) FROM student GROUP BY grade;

-- =========PRACTICE===========
SELECT city, AVG(marks) FROM student GROUP BY city ORDER BY city asc;

CREATE TABLE payments(
id INT PRIMARY KEY,
name VARCHAR(50),
mode VARCHAR(50),
city VARCHAR(20));

INSERT INTO payments (id, name , mode, city) VALUES
(101, 'Olivia Barrett', 'Netbanking', 'Portland'),
(102, 'Ethan Sinclair', 'Credit Card', 'Miami'),
(103, 'Maya Hernandez', 'Credit Card', 'Seattle'),
(104, 'Liam Donovan', 'Netbanking', 'Denver'),
(105, 'Sophia Nguyen', 'Credit Card', 'New Orleans'),
(106, 'Caleb Foster', 'Debit Card', 'Minneapolis'),
(107, 'Ava Patel', 'Debit Card', 'Phoenix'),
(108, 'Lucas Carter', 'Netbanking', 'Boston'),
(109, 'Isabella Martinez', 'Netbanking', 'Nashville'),
(110, 'Jackson Brooks', 'Credit Card', 'Boston');

SELECT mode, count(name) as total_customers FROM payments GROUP BY mode ORDER BY mode;
  
/*
===================Having Clause===================

Similar to Where i.e. applies some condition on rows.
Used when we want to apply any condition after grouping.
*/

SELECT city, count(name) FROM student where marks > 90 GROUP BY city;

SELECT city, count(name) FROM student GROUP BY city HAVING MAX(marks) > 90;                                                         


/*
=======================General Order========================

SELECT column(s)

FROM table_name

WHERE condition

GROUP BY column(s)

HAVING condition

ORDER BY column(s) ASC;

WHERE is for ROW conditions
HAVING is for GROUP conditions
*/

SELECT city, COUNT(name) FROM student WHERE marks >= 80 GROUP BY city HAVING MAX(marks) > 90 ORDER BY city LIMIT 3;

SELECT city FROM student WHERE grade = "A" GROUP BY city HAVING MAX(marks) >= 93 ORDER BY city ASC LIMIT 2; 

/*
============Table related Queries=============

-------------Update-------------
(to update existing rows)

UPDATE table_name
SET col1 = val1, col2 = val2
WHERE condition;
*/

SET SQL_SAFE_UPDATES = 0;

UPDATE student
SET grade = "O"
WHERE grade = "A";

UPDATE student
SET marks = 72
WHERE marks = 82;

UPDATE student
SET grade = "B"
WHERE marks BETWEEN 70 AND 80;

UPDATE student
SET marks = 82
WHERE rollno = 106;

UPDATE student
SET marks = marks + 1;

UPDATE student
SET marks = marks - 1;

SELECT * FROM student;

/*
===================Delete (to delete existing rows)==============================

DELETE FROM table_name
WHERE condition;
*/

UPDATE student
SET marks = 12
WHERE rollno = 105;

DELETE FROM student
WHERE marks < 30;

SELECT * FROM student

/*
=====================Cascading for FK=================

-----------------On Delete Cascade------------------
When we create a foreign key using this option, it deletes the referencing rows in the child table
when the referenced row is deleted in the parent table which has a primary key.

-------------------------On Update Cascade------------------
When we create a foreign key using UPDATE CASCADE the referencing rows are updated in the child
table when the referenced row is updated in the parent table which has a primary key.
*/


CREATE TABLE dept (
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO dept VALUES
(101, "english"),
(102, "it");

UPDATE dept
SET id = 103
WHERE id = 102;

CREATE TABLE teacher (
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

INSERT INTO teacher VALUES
(101, "adam", 101),
(102, "eve", 102); 

select * from dept;
SELECT * FROM teacher;

/*
-------------------Alter (to change the schema)----------------------
--ADD COLUMN
ALTER TABLE table_name
ADD COLUMN column_name datatype constraint;

-- REMOVE COLUMN
ALTER TABLE table_name
DROP COLUMN column_name;

-- RENAME TABLE
ALTER TABLE table_name
RENAME TO new_table_name;

-- RENAME COLUMN
ALTER TABLE table_name
CHANGE COLUMN old_name new_name new_datatype new_constraint;

-- MODIFY COLUMN FEATURE
ALTER TABLE table_name
MODIFY col_name new_datatype new_constraint;

-----------Truncate------------
to delete table's data

TRUNCATE TABLE table_name ;
*/

ALTER TABLE student
ADD COLUMN age INT NOT NULL;

ALTER TABLE student
DROP COLUMN age;

ALTER TABLE student
RENAME TO students;

ALTER TABLE students
RENAME TO student;

ALTER TABLE student
CHANGE COLUMN marks scores INT;

ALTER TABLE student
CHANGE COLUMN scores marks INT;

ALTER TABLE student
MODIFY name VARCHAR(20);

ALTER TABLE student
MODIFY marks VARCHAR(2);

ALTER TABLE student
MODIFY marks int;

TRUNCATE TABLE student;

SELECT * FROM student;

/*
==============LIKE====================
SELECT * FROM table_name where col_name LIKE first_letter% -- for the starting with
SELECT * FROM table_name where col_name LIKE %first_letter -- for the starting with
SELECT * FROM table_name where col_name LIKE %word% -- for the starting with
*/


/*
==================Joins in SQL==================
-- Join is used to combine rows from two or more tables, based on a related column between them.

Types of Joins
-- Inner Join 
-- outer joint
Left Join 
Right Join 
Full Join(union)

Inner Join
Returns records that have matching values in both tables

Left Join
Returns all records from the left table, and the matched records from
the right table

Right Join
Returns all records from the right table, and the matched records
from the left table

Full Join (union)
Returns all records when there is a match in either left or right table
*/

use college;

create table students(
id int primary key,
name varchar(50)
);
insert into students values
(101, "adam"),
(102, "bob"),
(103, "casey");

create table course(
id int primary key,
course varchar(50));

insert into course values
(102, "english"),
(105,"math"),
(103, "science"),
(107, "cs");

-- inner joint
select *
from students

inner join course
on students.id = course.id;

-- left join
select *
from students
left join course
on students.id = course.id; 

-- right join
select * 
from students 
right join course 
on students.id = course.id;

-- union 
select * 
from students 
left join course 
on students.id = course.id 
union 
select * 
from students 
right join course 
on students.id = course.id;

-- left exclusive join
select * 
from students 
left join course 
on students.id = course.id 
where course.id is null;

-- right exclusive join
select * 
from students 
right join course 
on students.id = course.id 
where students.id is null;

-- exclusive union
select * 
from students 
left join course 
on students.id = course.id 
where course.id is null 
union 
select * 
from students 
right join course 
on students.id = course.id 
where students.id is null;

select * from students;

select * from course;

-- JOIN (self            )
create table if not exists employees(
id int primary key,
name varchar(50),
manager_id int
); 

insert into employees values
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", null),
(104, "donald", 103);

select * 
from employees as a 
join employees as b 
on a.id = b.manager_id;

select a.name as manager_id, b.name 
from employees as a 
join employees as b 
on a.id = b.manager_id;

/*
=========================Union=========================
--It is used to combine the result-set of two or more SELECT statements.
Gives UNIQUE records.

Syntax
SELECT column(s) FROM tableA
UNION
SELECT column(s) FROM tableB
*/

-- union
select * from employees
union
select * from employees;

-- union all 
select * from employees
union all
select * from employees;

/*
=================SQL Sub Queries====================
A Subquery or Inner query or a Nested query is a query within another SQL query.

-- Query
-- Sub Query

It involves 2 select statements.

Syntax

SELECT column(s)
FROM table_name
WHERE col_name operator
( subquery );
*/ 

-- sub queries

create table marks(
rollno int primary key,
name varchar(50),
marks int not null );

alter table marks
add column city varchar(50);

insert into marks values
(101, "anil", 78, "pune"),
(102, "bhumika", 93, "mumbai"),
(103, "chrtan", 85, "mumbai"),
(104, "dhruv", 96, "delhi"),
(105, "emanuel", 92, "delhi"),
(106, "farah", 82, "delhi");

truncate table marks;

select avg(marks) from marks;

select name, marks from marks where marks > 87.6667;

select * from marks where marks > (select avg(marks) from marks);

select * from marks where rollno % 2 = 0;

select name, rollno from marks where rollno in (102, 104, 106);

select * from marks where rollno in (select rollno from marks where rollno % 2 = 0);

select * from marks where city = "delhi";

select max(marks) from marks;

select max(marks) from marks where city = "mumbai";  

select max(marks) from (select * from marks where city = "mumbai") as temp;

create view view1 as select rollno, name, marks from marks;

select * from view1;

drop view view1;

-- windows function
select name, marks, city, row_number() over(order by marks desc) from marks;

/*
===============================CASE=======================
CASE is a conditional expression in SQL. It works like if-else in programming languages. It's commonly used to:

Create new derived columns.
Transform data for reporting.
Simplify complex conditions inside SELECT, WHERE, ORDER BY clauses.
*/

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    customer_type_code CHAR(1),  -- 'R' = Retail, 'C' = Corporate, 'H' = HNI (High Networth Individual)
    annual_income DECIMAL(12,2),
    balance DECIMAL(12,2)
);

INSERT INTO customers (customer_id, customer_name, customer_type_code, annual_income, balance) VALUES
(1, 'John Doe',     'R', 450000, 5000),
(2, 'ACME Corp',    'C', 25000000, 3000000),
(3, 'Jane Smith',   'R', 1200000, 150000),
(4, 'Elite Pvt Ltd','C', 6000000, 1000000),
(5, 'Rajesh Kumar', 'R', 900000, 7500),
(6, 'Global Funds', 'C', 40000000, 5000000),
(7, 'Arun HNI',     'H', 8000000, 2000000),
(8, 'XYZ Ltd',      'C', 9000000, 750000),
(9, 'Sara Khan',    'R', 300000, 2000),
(10, 'Omkar Patel', 'R', 650000, 45000);

select customer_id, customer_name, balance,
case
when balance > 2000000 then "high risk"
when balance between 500000 and 2000000 then "medium risk"
else "low risk"
end as risk_category
from customers;

select customer_id, customer_name, customer_type_code,
case customer_type_code
when "R" then "retail_customer"
when "C" then "comercial_customer"
when "H" then " high networth indivisual"
else "unknown"
end as customer_type
from customers;

/*
✅ RANK(), DENSE_RANK(), ROW_NUMBER() in SQL

These are window functions used for ranking data within partitions. They help in generating reports like:

Top N Customers
Branch-wise performance
Risk exposure ranking

🔷 Differences:

ROW_NUMBER()	Unique numbers                (1, 2, 3...) even if tied
RANK()      	Leaves gaps if there are ties (1, 1, 3)
DENSE_RANK()	No gaps for ties              (1, 1, 2)
*/

CREATE TABLE branch_accounts (
    account_id INT PRIMARY KEY,
    branch_id INT,
    customer_name VARCHAR(50),
    account_balance DECIMAL(12,2)
);

INSERT INTO branch_accounts (account_id, branch_id, customer_name, account_balance) VALUES
(1, 101, 'John Doe', 50000),
(2, 101, 'Jane Smith', 100000),
(3, 101, 'Alice Thomas', 100000),
(4, 101, 'Robert Brown', 75000),
(5, 102, 'ACME Corp', 5000000),
(6, 102, 'Elite Pvt Ltd', 5000000),
(7, 102, 'Global Holdings', 3000000),
(8, 102, 'XYZ Ltd', 3000000),
(9, 103, 'Sara Khan', 2000),
(10, 103, 'Omkar Patel', 2000),
(11, 103, 'Anjali Mehta', 5000);

select branch_id, customer_name, account_balance,
row_number() over(partition by branch_id order by account_balance) as row_num,
rank() over(partition by branch_id order by account_balance) as rank_num,
dense_rank() over(partition by branch_id order by account_balance) as dense_num
from branch_accounts;

SELECT *
FROM (
    SELECT branch_id, customer_name, account_balance,
           RANK() OVER (PARTITION BY branch_id ORDER BY account_balance DESC) AS rank_num
    FROM branch_accounts
) ranked
WHERE rank_num <= 2;

SELECT branch_id, customer_name, account_balance,
       CASE 
           WHEN account_balance >= 3000000 THEN 'Platinum'
           WHEN account_balance BETWEEN 50000 AND 2999999 THEN 'Gold'
           ELSE 'Silver'
       END AS balance_tier
FROM branch_accounts;
