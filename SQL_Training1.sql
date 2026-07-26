CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

INSERT INTO employee (emp_id, emp_name, salary, department)
VALUES
(1001, 'Sreeni', 60000, 'IT'),
(1002, 'Priya', 60000, 'IT'),
(1003, 'David', 55000, 'Sales'),
(1004, 'Ganesh', 65000, 'Finance'),
(1005, 'OM', 70000, 'IT'),
(1006, 'Syed', 65000, 'Finance'),
(1007, 'Aimum', 65000, 'Finance'),
(1008, 'Surthi', 65000, 'Sales');
 
 select * from employee;
 
 # CREATING TABLE HOSPITAL WITH PRIMARY KEY (constraint)
 
 CREATE TABLE Hospital (
    Hospital_ID INT PRIMARY KEY,
    Hospital_Name VARCHAR(100) NOT NULL,
    City VARCHAR(50),
    State VARCHAR(50)
);



#----------------------------------------------------------------------------
 # CREATING TABLE DEPARTMENT WITH FOREIGN KEY AND REFERENCE KEY (constraint)
#----------------------------------------------------------------------------

CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50) NOT NULL,
    Hospital_ID INT,
    FOREIGN KEY (Hospital_ID)
    REFERENCES Hospital(Hospital_ID)
);

#-------------------------------------------------------------------------------------
 # CREATING TABLE EMPLOYEE WITH PRIMARY KEY/FOREIGN KEY AND REFERENCE KEY (constraint)
#-------------------------------------------------------------------------------------
 
 CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(100) NOT NULL,
    Job_Title VARCHAR(50),
    Salary DECIMAL(10,2),
    Age INT,
    Department_ID INT,
    Email VARCHAR(100) UNIQUE,
    FOREIGN KEY (Department_ID)
    REFERENCES Department(Department_ID)
);

#-------------------------------------------------------------------
 # CREATING TABLE Patient WITH PRIMARY KEY (constraint)
#-------------------------------------------------------------------

CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    Age INT,
    Disease VARCHAR(100),
    Admission_Date DATE,
    Discharge_Date DATE,
    Doctor_ID INT,
    Hospital_ID INT,
    FOREIGN KEY (Doctor_ID)
        REFERENCES Employee(Employee_ID),
    FOREIGN KEY (Hospital_ID)
        REFERENCES Hospital(Hospital_ID)
);


#-------------------------------------------------------------------
 # INSERT INTO VALUES - TABLE Patient
#-------------------------------------------------------------------

INSERT INTO Hospital VALUES
(1,'Royal Hospital','London','England'),
(2,'City Hospital','Manchester','England'),
(3,'General Hospital','Cambridge','England');


#-------------------------------------------------------------------
 # INSERT INTO VALUES - TABLE Department
#-------------------------------------------------------------------

INSERT INTO Department VALUES
(101,'Cardiology',1),
(102,'Neurology',1),
(103,'Orthopaedics',2),
(104,'Emergency',2),
(105,'Paediatrics',3);


#-------------------------------------------------------------------
 # INSERT INTO VALUES - TABLE Employee
#-------------------------------------------------------------------

INSERT INTO Employee VALUES
(1001,'John Smith','Doctor',70000,40,101,'john@gmail.com'),
(1002,'Priya Kumar','Nurse',45000,30,101,'priya@gmail.com'),
(1003,'David Lee','Doctor',75000,45,102,'david@gmail.com'),
(1004,'Ganesh Kumar','Technician',35000,28,103,'ganesh@gmail.com'),
(1005,'Sarah Jones','Doctor',80000,42,104,'sarah@gmail.com'),
(1006,'James Brown','Nurse',42000,29,105,'james@gmail.com'),
(1007,'Emily Clark','Receptionist',30000,25,104,'emily@gmail.com');


#-------------------------------------------------------------------
 # INSERT INTO VALUES - TABLE Patient
#-------------------------------------------------------------------

INSERT INTO Patient VALUES
(501,'Michael','Male',45,'Heart Disease','2025-07-01','2025-07-08',1001,1),
(502,'Sophia','Female',30,'Migraine','2025-07-02','2025-07-04',1003,1),
(503,'Daniel','Male',55,'Fracture','2025-07-03','2025-07-10',1005,2),
(504,'Emma','Female',22,'Fever','2025-07-05','2025-07-06',1005,2),
(505,'Oliver','Male',60,'Heart Disease','2025-07-06','2025-07-12',1001,1),
(506,'Charlotte','Female',35,'Asthma','2025-07-07','2025-07-09',1003,1);

# ----------------------------------------------------------
# Select all from table - to see all the columns in a table
#-----------------------------------------------------------


SELECT * FROM Hospital;

SELECT * FROM Department;

SELECT * FROM Employee;

SELECT * FROM Patient;

# ----------------------------------------------------------
# FILTER (Where) - to check the filter
#-----------------------------------------------------------

select * from Employee 
where Department_ID = 101;

select * from Employee 
where salary >= 55000;


# -----------------------------------------------------------------------------
# CONDITION (Where) - to check the Conditions ( AND , OR , NOT , IN , BETWEEN )
#------------------------------------------------------------------------------

#AND

SELECT *
FROM Employee
WHERE Salary > 50000
AND Age > 35;

Select Employee_ID, Employee_Name,Job_title, age
From Employee
Where Salary > 50000 and age > 35;

#-----------------------------------------------------------------------

#OR

select Employee_ID, Employee_Name,Age,Job_Title
from employee 
Where age = 40 or Job_Title = 'Nurse'; 

SELECT *
FROM Employee
WHERE Department_ID = 101
OR Department_ID = 102;

#-----------------------------------------------------------------------

#BETWEEN

select * from employee 
where age between 30 and 40;

select Employee_ID,Employee_Name,Age,Job_title,salary
from Employee
where salary between 50000 and 80000; 


#-----------------------------------------------------------------------

#IN

select * from employee
where age in (30 , 40);

SELECT *
FROM Employee
WHERE Department_ID IN (101,102);

#-----------------------------------------------------------------------


#NOT

select *
From Employee
where not employee_ID =1001;



# -----------------------------------------------------------------------------
# SORT (ORDER BY) (Where) - to check the Sorting orders
#------------------------------------------------------------------------------

#Ascending

select *
From Employee
order by Employee_Name Asc;

SELECT *
FROM Employee
ORDER BY Salary ASC;


#Descending

SELECT *
FROM Employee
ORDER BY Employee_ID DESC;



# -----------------------------------------------------------------------------
# Aggregate Functions - to check the MIN, MAX, AVG, SUM, COUNT
#------------------------------------------------------------------------------

#MIN  ( Lowest Salary)

SELECT MIN(Salary)
FROM Employee ;

#------------------------------------
#MAX  ( MAX Salary)

SELECT MAX(Salary)
FROM Employee;

#--------------------------------------
#AVG  ( AVG Salary)

SELECT AVG(Salary)
FROM Employee;

#--------------------------------------
#SUM  ( SUM Salary)

SELECT SUM(Salary)
FROM Employee;

#--------------------------------------
#COUNT  ( COUNT Salary)

SELECT COUNT(Employee_Name)
FROM Employee;

SELECT COUNT(*)
FROM Employee;

# -----------------------------------------------------------------------------
# GROUP BY - to check the group ny 
#------------------------------------------------------------------------------

SELECT 
Department_ID,
COUNT(*)
FROM Employee
GROUP BY Department_ID;

SELECT
Department_ID,
AVG(Salary) 
FROM Employee
GROUP BY Department_ID;


# -----------------------------------------------------------------------------
# HAVING CLAUSE - to check the Having condition
#------------------------------------------------------------------------------

select Department_ID, avg(salary)
from employee
group by Department_ID
having Department_ID = 102;

SELECT
Department_ID,
AVG(Salary)
FROM Employee
GROUP BY Department_ID
HAVING AVG(Salary)<40000;


# -----------------------------------------------------------------------------
# LIKE OPERATOR % Prefix / Suffix %- to check the Having condition
#------------------------------------------------------------------------------

#Prefix
select *
From Employee
Where Employee_name like '%r';

#Suffix
select *
From Employee
Where Employee_name like 'J%';

#second letter starts with a

SELECT *
FROM Employee
WHERE Employee_Name LIKE '_a%';

#contains letter a

SELECT *
FROM Employee
WHERE Employee_Name LIKE '%a%';

#-----------------------------------------------
# DELETE
#-----------------------------------------------

#Delete one Employee from Employee table

Delete from Employee
where employee_ID = 1007;

select * from Employee;

#Delete employees from particular Depratment from Employee Table

delete from employee
where Department_ID = 105;


#-----------------------------------------------
# TRUNCATE - Remove all records but keep the Structure table:
#-----------------------------------------------

Create table Rheaa
(ID INT PRIMARY KEY,
 Name Varchar(20));
 
 insert into rheaa
 (ID,Name) 
 values(1002,'Rakesh');

Select * from Rheaa;
Truncate Rheaa



Create table Saatvik (
ID INT PRIMARY KEY,
NAME VARCHAR(20),
SALARY FLOAT (10,2),
AGE INT);

#----------------------------------------------
#ALTER TABLE - Used to modify an existing table. like Add a column
#---------------------------------------------

alter table saatvik
add (Address VARCHAR(10),dept char(2));
ALTER TABLE Saatvik
ADD Status VARCHAR(20) DEFAULT 'Active';
ALTER TABLE Saatvik
ADD Location VARCHAR(50) NOT NULL DEFAULT 'London';
select * from Saatvik;

INSERT INTO Saatvik 
(ID, NAME, SALARY, AGE,city, Address, dept, Status, Location)
VALUES
(1001, 'John', 50000.50, 30,'Barking', 'London', 'IT', 'Active', 'London'),
(1002, 'Alice', 65000.75, 28, 'Cretia','Paris', 'HR', 'Active', 'Paris'),
(1003, 'David', 72000.00, 35, 'Frankfurt','Berlin', 'FN', 'Inactive', 'Berlin'),
(1004, 'Emma', 58000.25, 27, 'Romecity','Rome', 'MK', 'Active', 'Rome'),
(1005, 'Michael', 90000.00, 40, 'Realmad' ,'Madrid', 'IT', 'Active', 'Madrid');

#-----------------------------------------------------------------
#Modify a column
#-----------------------------------------------------------------
Alter table saatvik
Modify dept varchar(12);
select * from Saatvik;

INSERT INTO Saatvik 
(ID, NAME, SALARY, AGE,city, Address, department, Status, Location)
VALUES
(1011, 'Ganesh', 50000.50, 40, 'Realmad' ,'Madrid', 'IT_IT_IT', 'Active', 'Madrid'),
(1009, 'OM', 80000.00, 40, 'Realmad' ,'Madrid', 'IT_IT_IT', 'Active', 'Madrid');

#-----------------------------------------------------------------
#Rename a column
#-----------------------------------------------------------------

ALTER table saatvik
rename column dept to department;

#-------------------------------------------------------------------------------------
#DROP Table  - Delete complete table
#-------------------------------------------------------------------------------------



#-------------------------------------------------------------------------------------
#DROP Table  - Delete complete table
#-------------------------------------------------------------------------------------

DROP Table Rheaa  # table removed permanently


#-------------------------------------------------------------------------------------
#INNER JOIN  - Employee with department:
#An INNER JOIN is used to combine rows from two or more tables based on a related column. 
#It returns only the records that have matching values in both tables.
#-------------------------------------------------------------------------------------

SELECT *
FROM Employee e
INNER JOIN Department d
ON e.Department_ID=d.Department_ID;

SELECT
e.Employee_Name,
d.Department_Name
FROM Employee e
INNER JOIN Department d
ON e.Department_ID=d.Department_ID;

select * 
from Employee as EMP
INNER JOIN Department as DEPT
ON EMP.Department_ID = DEPT.Department_ID;

select * from Employee;

#-------------------------------------------------------------------------------------
#LEFT JOIN - Employee + Department - A LEFT JOIN (also called LEFT OUTER JOIN) returns
#All records from the left table
#Only the matching records from the right table
#If there is no match, the columns from the right table return NULL
#-------------------------------------------------------------------------------------

#LEFT JOIN (also called LEFT OUTER JOIN)

SELECT
*
FROM Employee e
LEFT JOIN Department d
ON e.Department_ID=d.Department_ID;

#-------------------------------------------------------------------------------------
#RIGHT JOIN - Employee + Department - A RIGHT JOIN (also called RIGHT OUTER JOIN) returns
#All records from the Right table
#Only the matching records from the Left table
#If there is no match, the columns from the Left table return NULL
#--------------------------------------------------------------------------------------

SELECT e.Employee_Name,
       d.Department_Name
FROM Employee e
RIGHT JOIN Department d
ON e.Department_ID=d.Department_ID;

#-------------------------------------------------------------------------------------
#FULL OUTER JOIN - Employee + Department - FULL OUTER JOIN = LEFT JOIN + RIGHT JOIN
#All rows from the left table
#All rows from the right table
#Matching rows are combined.
#If there is no match, the missing side returns NULL
#--------------------------------------------------------------------------------------

SELECT e.Employee_Name,e.Department_ID
FROM Employee e
FULL OUTER JOIN Department d
ON e.Department_ID=d.Department_ID;

SELECT *
FROM Employee e
LEFT JOIN Department d
ON e.Department_ID=d.Department_ID

UNION

SELECT *
FROM Employee e
RIGHT JOIN Department d
ON e.Department_ID=d.Department_ID;


#-------------------------------------------------------------------------------------
#3 Table join - Employee + Department + Hospital
#-------------------------------------------------------------------------------------

Select 
e.employee_ID,
e.Employee_Name,
e.Department_ID
From Employee e   #TABLE1
Join department d  #TABLE2
on e.department_ID = d.department_ID
join hospital h #TABLE3
on d.hospital_ID = h.Hospital_ID;

Select *
From Employee e   # TABLE 1

Join department d   # TABLE 2
on e.department_ID = d.department_ID

join hospital h   # TABLE 3
on d.hospital_ID = h.Hospital_ID;


#-------------------------------------------------------------------------------------
#UNION - Combines results and removes duplicates:
#-------------------------------------------------------------------------------------

select d.department_ID
from department d
UNION
select e.department_ID
from employee e;

select * from employee;
select * from department;

#-------------------------------------------------------------------------------------
#UNION ALL - Combines results and Keep duplicates:
#-------------------------------------------------------------------------------------

select d.department_ID
from department d
UNION ALL
select e.department_ID
from employee e;

#-------------------------------------------------------------------------------------
#Window Functions - Window functions perform calculations across rows without grouping the result.
#-------------------------------------------------------------------------------------

SELECT 
ID,
Name,
Salary,
ROW_NUMBER() OVER(ORDER BY Salary Desc) AS Row_Num
FROM Saatvik;

#-----------------------------------------------------------------------------------------------
#RANK() - Employees with the same salary receive the same rank, and the next rank is skipped..
#-----------------------------------------------------------------------------------------------

SELECT 
ID,
Name,
Salary,
RANK() OVER(ORDER BY Salary ASC) AS Rank_No
FROM Saatvik;

select * from employee

#-----------------------------------------------------------------------------------------------
#DENSE_RANK() - Employees with the same salary receive the same rank, but does not skip rank numbers.
#-----------------------------------------------------------------------------------------------

SELECT 
ID,
Name,
Salary,
DENSE_RANK() OVER(ORDER BY Salary ASC) AS Rank_No
FROM Saatvik;

#-----------------------------------------------------------------------------------------------
#LEAD() - Returns the value from the next row..
#-----------------------------------------------------------------------------------------------

SELECT 
ID,
Name,
Salary,
LEAD(Salary) OVER(ORDER BY Salary ASC) AS NEXT_SALARY
FROM Saatvik;

select * from Saatvik;

#-----------------------------------------------------------------------------------------------
#LAG() - Returns the value from the Previous row..
#-----------------------------------------------------------------------------------------------

SELECT 
ID,
Name,
Salary,
LAG(Salary) OVER(ORDER BY Salary ASC) AS NEXT_SALARY
FROM Saatvik;

select * from Saatvik;

#------------------------------------------------------------------------------------------------------
#CTE (Common Table Expression)
#--------------------------------------------------------------------------------------------------------

WITH HighSalary AS
(
SELECT *
FROM Employee
WHERE Salary > 60000
)
SELECT *
FROM HighSalary;

#-----------------------------------------------
#Multiple CTEs
# A Common Table Expression (CTE) is a temporary result set defined using the WITH clause.
# It improves query readability 
# Useful for recursive queries and breaking complex logic into smaller parts.
#------------------------------------------------

WITH Doctor AS
(
    SELECT *
    FROM Employee
    WHERE Job_Title = 'Doctor'
),
HighSalary AS
(
    SELECT *
    FROM Doctor
    WHERE Salary > 70000
)

SELECT *
FROM HighSalary;


#----------------------------------------------------------------------
# Views
# A View is a virtual table based on the result of a SQL query
# A View is a virtual table created from one or more tables.
# It simplifies complex queries, improves security by hiding sensitive columns, and promotes query reuse.
# It does not store data itself
# it stores the query definition
#----------------------------------------------------------------------

CREATE VIEW Doctor1_View AS
SELECT
Employee_ID,
Employee_Name,
Salary
FROM Employee
WHERE Job_Title = 'Doctor';

#====================================================================
# Update a View
#====================================================================

DROP VIEW Doctor1_View;

#====================================================================
# Update a View - 
#====================================================================

CREATE OR REPLACE VIEW Doctor_View AS
SELECT Employee_Name,
       Salary
FROM Employee
WHERE Salary > 60000;
