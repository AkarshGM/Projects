-- Task 1 Create a Database

CREATE DATABASE IF NOT EXISTS techmac_db;

-- Task 2 Create three tables to store details

Use techmac_db;
CREATE TABLE techhyve_employees
(employee_id varchar(50) PRIMARY KEY,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
gender varchar (50) NOT NULL,
age INT CHECK (age>21 & age<55) NOT NULL );

CREATE TABLE techcloud_employees
(employee_id varchar(50) PRIMARY KEY,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
gender varchar (50) NOT NULL,
age INT CHECK (age>21 & age<55) NOT NULL );

CREATE TABLE techsoft_employees
(employee_id varchar (50) PRIMARY KEY,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
gender varchar (50) NOT NULL,
age INT CHECK (age>21 & age<55) NOT NULL );

-- Task 3 Alter three tables and add new column

ALTER TABLE techhyve_employees ADD (Communication_Proficiency INT CHECK (Communication_Proficiency>0 & Communication_Proficiency<5) DEFAULT "1");
ALTER TABLE techcloud_employees ADD (Communication_Proficiency INT CHECK (Communication_Proficiency>0 & Communication_Proficiency<5) DEFAULT "1");
ALTER TABLE techsoft_employees ADD (Communication_Proficiency INT CHECK (Communication_Proficiency>0 & Communication_Proficiency<5) DEFAULT "1");

-- Task 4  Insert the Employee details into the Tables

INSERT INTO techhyve_employees (employee_id, first_name, last_name, gender, age, Communication_Proficiency)
      VALUES ("TH0001", "Eli", "Evans", "Male", "26", "1"),
             ("TH0002", "Carlos", "Simmons", "Male", "32", "2"),
             ("TH0003", "Kathie", "Bryant", "Female", "25", "1"),
             ("TH0004", "Joey", "Hughes", "Male", "41", "4"),
             ("TH0005", "Alice", "Matthews", "Female", "52", "4");
             
INSERT INTO techcloud_employees (employee_id, first_name, last_name, gender, age, Communication_Proficiency)
      VALUES ("TC0001", "Teresa", "Bryant", "Female", "39", "2"),
             ("TC0002", "Alexis", "Patterson", "Male", "48", "5"),
             ("TC0003", "Rose", "Bell", "Female", "42", "3"),
             ("TC0004", "Gemma", "Watkins", "Female", "44", "3"),
             ("TC0005", "Kingston", "Martinez", "Male", "29", "2");
             
INSERT INTO techsoft_employees (employee_id, first_name, last_name, gender, age, Communication_Proficiency)
      VALUES ("TS0001", "Peter", "Burtler", "Male", "44", "4"),
             ("TS0002", "Harold", "Simmons", "Male", "54", "4"),
             ("TS0003", "Juliana", "Sanders", "Female", "36", "2"),
             ("TS0004", "Paul", "Ward", "Male", "29", "2"),
             ("TS0005", "Nicole", "Bryant", "Female", "30", "2");
             
-- Task 5 Backup & Rename in new database 

CREATE DATABASE IF NOT EXISTS backup_techmac_db;
Use  backup_techmac_db;  

CREATE TABLE IF NOT EXISTS techhyve_employees_bkp SELECT * FROM techmac_db.techhyve_employees;
CREATE TABLE IF NOT EXISTS techcloud_employees_bkp SELECT * FROM techmac_db.techcloud_employees;
CREATE TABLE IF NOT EXISTS techsoft_employees_bkp SELECT * FROM techmac_db.techsoft_employees;  

-- Task 6 Delete data of resigned employees from original database

USE techmac_db;
DELETE FROM techhyve_employees WHERE employee_id = "TH0003";
DELETE FROM techhyve_employees WHERE employee_id = "TH0005";

DELETE FROM techcloud_employees WHERE employee_id = "TC0001";
DELETE FROM techcloud_employees WHERE employee_id = "TC0004";

-- Task 7 Merge two tables and Delete the records from original tables

CREATE TABLE IF NOT EXISTS techhyvecloud_employees LIKE techhyve_employees;
INSERT INTO techhyvecloud_employees SELECT * FROM techhyve_employees;
INSERT INTO techhyvecloud_employees SELECT * FROM techcloud_employees;

TRUNCATE techhyve_employees;
TRUNCATE techcloud_employees;

-- ALL TASKS ARE COMPLETED
			











