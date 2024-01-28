CREATE DATABASE IF NOT EXISTS COACHING_INSTITUTE;
USE COACHING_INSTITUTE;

CREATE TABLE Branch_manager(
brm_id INT PRIMARY KEY,
salary INT,
gender VARCHAR(1),
brm_fname VARCHAR(10),
brm_lname VARCHAR(10)
);

INSERT INTO Branch_manager
VALUES  (1000,25000,'M','Raghav','Patel'),
		(1001,28000,'F','Raveena','Tandan'),
        (1002,20000,'F','Sakshi','Mirza');
        
        select*from Branch_manager;

CREATE TABLE Branch(
br_name VARCHAR(20) PRIMARY KEY,
city VARCHAR(10),
managed_by INT,
FOREIGN KEY(managed_by)REFERENCES Branch_manager(brm_id)
);

INSERT INTO Branch
VALUES ('Kandivali','Mumbai',1001),
	   ('Dadar','Mumbai', 1002),
       ('Jogeshwari','Mumbai',1000);
       
select * from Branch;

CREATE TABLE Course(
c_name VARCHAR(30) PRIMARY KEY,
duration VARCHAR(10),
fee INT
);

INSERT INTO Course
VALUES ('DOT','6_MONTH',5000),
	   ('DOT_2.0','6_MONTH',5200),
       ('SUPREME_2.0','6_MONTH',3600),
       ('SUPRA','5_MONTH',3200);
       
       select * from Course;





CREATE TABLE Student(
s_id INT PRIMARY KEY,
s_fname VARCHAR(50),
s_lname VARCHAR(50),
DOB DATE,
gender VARCHAR(1),
fee_status VARCHAR(10),
branch VARCHAR(20),
course_taken VARCHAR(20),
FOREIGN KEY(branch)REFERENCES Branch(br_name)ON DELETE CASCADE,
FOREIGN KEY(course_taken)REFERENCES  Course(c_name)ON DELETE CASCADE
);

select * from student;

INSERT INTO student
VALUES (001,'Raju','Parmar','2004-11-10','M','PAID','Kandivali','DOT'),
	   (002,'Sneha','Yadav','2004-07-10','F','PAID','Kandivali','SUPRA'),
       (003,'Vijay','Shah','2003-01-12','M','PENDING','Jogeshwari','SUPREME_2.0'),
       (004,'Shyam','Sharma','2003-08-24','M','PENDING','Dadar','SUPREME_2.0');
       
CREATE TABLE Teacher(
t_id INT,
t_fname VARCHAR(10),
t_lname VARCHAR(10),
gender VARCHAR(1),
salary INT,
branch VARCHAR(20),
course_teaches VARCHAR(20),
FOREIGN KEY(branch)REFERENCES Branch(br_name)ON DELETE CASCADE,
FOREIGN KEY(course_teaches)REFERENCES Course(c_name)ON DELETE CASCADE
);

INSERT INTO Teacher
VALUES (100,'Love','Babbar','M',300000,'Dadar','DOT'),
	   (100,'Love','Babbar','M',300000,'Jogeshwari','DOT_2.0'),
       (101,'Lakshay','Kumar','M',400000,'Kandivali','SUPREME_2.0'),
       (101,'Lakshay','Kumar','M',400000,'Kandivali','SUPRA');

select * from Teacher;
