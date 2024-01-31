CREATE DATABASE IF NOT EXISTS ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker(
 WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 FIRST_NAME VARCHAR(255),
 LAST_NAME VARCHAR(255),
 SALARY INT(15),
 JOINING_DATE DATETIME,
 DEPARTMENT VARCHAR(255)
 );
 
 CREATE TABLE Worker( 
 WORKER_ID INT,
 FIRST_NAME VARCHAR(255),
 LAST_NAME VARCHAR(255),
 SALARY INT(15),
 JOINING_DATE DATETIME,
 DEPARTMENT VARCHAR(255),
 PRIMARY KEY(WORKER_ID) -- ALSO POSSIBLE THIS WAY PRIMARY KEY
 );

INSERT INTO Worker (WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) VALUES
(001, 'Monika' , 'Arora' , 100000 , '14-02-20 09.00.00', 'HR'),
(002, 'Shweta' , 'Tiwari' , 90000 , '14-06-12 09.00.00', 'Admin'),
(003, 'Paras' , 'Waghela' , 70000 , '14-05-04 09.00.00', 'HR'),
(004, 'Heet' , 'Vichhivora' , 80000 , '14-02-22 09.00.00', 'Admin'),
(005, 'Megha' , 'Yadav' , 60000 , '14-05-21 09.00.00', 'Admin'),
(006, 'Dev' , 'Vora' , 50000 , '14-09-20 09.00.00', 'Account'),
(007, 'Parth' , 'Patel' , 60000 , '14-01-25 09.00.00', 'Account'),
(008, 'Abhi' , 'Mistry' , 50000 , '14-05-28 09.00.00', 'Admin');

INSERT INTO Worker (WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) VALUES
(009, 'KING' , 'RAJPUT' , 20000 , '24-06-20 09.00.00', NULL);

SELECT*FROM Worker;
SELECT*FROM bonus_details;
CREATE TABLE Bonus(
WORKER_REF_ID INT,
BONUS_AMOUNT INT(10),
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Bonus (WORKER_REF_ID,BONUS_AMOUNT,BONUS_DATE) VALUES
	(001,10000,'16-02-18'),
    (004,5000,'16-05-16'),
    (003,6000,'16-06-20'),
    (002,7000,'16-03-25'),
    (001,9000,'16-02-11');
    
CREATE TABLE Title(
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title (WORKER_REF_ID,WORKER_TITLE,AFFECTED_FROM) VALUES
	(001, 'Manager' ,'2016-02-20 00:00:00'),
    (002, 'Executive' ,'2016-04-22 00:00:00'),
    (003, 'Executive' ,'2016-06-21 00:00:00'),
    (004, 'Manager' ,'2016-03-21 00:00:00'),
    (005, 'Asst. Manager' ,'2016-06-20 00:00:00'),
    (006, 'Executive' ,'2016-02-22 00:00:00'),
    (007, 'Lead' ,'2016-03-20 00:00:00'),
    (008, 'Lead' ,'2016-02-20 00:00:00');
    
    -- select command powers
    SELECT * FROM Worker;
    SELECT SALARY FROM Worker;
    SELECT FIRST_NAME , SALARY FROM Worker;
    SELECT 11+22;
    SELECT NOW(); -- >current datetime
    SELECT LCASE("PARAS");
    SELECT UCASE("paras");
    
	SELECT * FROM Worker WHERE SALARY >= 70000;
    SELECT * FROM Worker WHERE DEPARTMENT='HR';
    
    SELECT * FROM Worker WHERE SALARY BETWEEN 80000 AND 100000;
    
    -- bad way
    SELECT * FROM Worker WHERE DEPARTMENT='HR' OR DEPARTMENT='ADMIN';
    -- better way
    SELECT * FROM Worker WHERE DEPARTMENT IN('HR','ADMIN');
    
    -- not AND/OR also exists
    SELECT * FROM Worker WHERE DEPARTMENT NOT IN('HR','ADMIN');
    
    -- is null
    SELECT * FROM Worker WHERE DEPARTMENT IS NULL;
    
    -- WILDCARD
    select * from worker where first_name LIKE '%i%'; -- i k pehle b kitne b char/nochar ho skta he and baad mebi
    select * from worker where first_name LIKE '_i%'; -- i 2nd no pr ho wesa fname _ k badle koibi 1 hi char aaega
    
    -- SORTING ASCENDING 		
    select * from worker ORDER BY SALARY; 
    -- SORTING DESCENDING 		
    select * from worker ORDER BY SALARY DESC; 
    
    -- DISTINCT
    select DISTINCT department from worker;
    
    -- DATA GROUPING -- aggregasion fn is req or it will behave like DISTINCT -- COUNT is regg fn
    select department,COUNT(department) from worker group by department;
    
    -- AVERAGE SALARY
    select department , AVG(salary) from worker group by department;
    
    -- MIN
    select department , MIN(salary) from worker group by department; 
    
    -- MAX
    select department , MAX(salary) from worker group by department;
    
    -- SUM
    select department , SUM(salary) from worker group by department;
    
    -- GROUP BY HAVING
    select department,COUNT(department) from worker group by department HAVING COUNT(department)>1;
    
    -- DDL CONSTRAINTS
    -- PRIMARY KEY CONSTR , FOREIGN KEY ALREADY DONE ABOVE
    
    -- UNIQUE CONSTR --> TO MAKE ANY ATTRIBUTE TO SET ONLY UNIQUE VALUES --> JUST WRITE "UNIQUE" AT THE END OF ATTRIBUTE INITIALIZATION
    
    -- CHECK-->CONSISTANCY CONSTR--> SYNTAX --> INSIDE CREATE TABLE -->
    -- CONSTRAINT acc_balance_chk CHECK(balance > 100) --> during insertion of balance if we provide <=100 rs then it will throw error
    
    -- DEFAULT --> SYNTAX --> balance INT NOT NULL DEFAULT 0;  --> if we not provide attribute value of that attribute , so by default it will set the value
    
    -- UPDATION --
    -- ADD NEW COLUMN
    ALTER TABLE bonus ADD score INT NOT NULL DEFAULT 0;
    SELECT * from bonus;
    
    -- MODIFY DATA TYPE
    ALTER TABLE bonus MODIFY score DOUBLE NOT NULL DEFAULT 0;
    DESC bonus_details; -- describe bonus table
    
    -- CHANGE COL NAME
    ALTER TABLE bonus CHANGE COLUMN score performance INT NOT NULL DEFAULT 0; -- OLD NAME , NEW NAME , DATA TYPE U WANT TO SET 
    
    -- DROP COLUMN
    ALTER TABLE bonus DROP COLUMN performance;
    
    -- RENAME TABLE
    ALTER TABLE bonus RENAME TO bonus_details;
    
    -- DML --> DATA MODIFICATION LANGUAGE ---> CRUD
    CREATE TABLE temp(
    id INT PRIMARY KEY,
    tname varchar(25),
    address varchar(50),
    city varchar(10),
    pincode int
    );
    
    INSERT INTO temp (id,tname,address,city,pincode) 
    VALUES (1251,'Rahul','Dilbag nagar','Delhi',1900); -- we can add more values like this -- already did above 
    
    INSERT INTO temp VALUES (1200,'CodeHelp','Junagarh','Delhi',8800); -- we can also do this -- but we have to make sure the sequence of adding
    
    INSERT INTO temp (id,tname) -- can do this also -- other values is set to their default if set , else set to NULL
    VALUES (1300,'Bob');
    
    select * from temp;
    
    USE org;
    -- UPDATE 
    UPDATE temp SET address='shanti nagar',city='Mumbai' where id=1300;
    
    -- UPDATE MULTIPLE ROWS
	SET SQL_SAFE_UPDATES=0;
    UPDATE temp SET pincode = 1111;
    update temp SET pincode = pincode + 1;
    
    -- DELETE (CASCADE / NULL )
    DELETE FROM temp WHERE id=1300; -- bob deleted
    -- to delete table
    DELETE FROM temp;
    
    CREATE TABLE customer(
    Customer_id INT PRIMARY KEY,
    tname varchar(25),
    gender varchar(1),
    city varchar(10),
    pincode int
    );
    select * from customer;
    INSERT INTO customer (Customer_id,tname,gender,city,pincode) 
    VALUES (1,'Rahul','M','Delhi',1900), 
           (2,'Manoj','M','Gujarat',1910),
           (3,'Garima','F','Mumbai',1820);
    
    
CREATE TABLE order_details(
    order_id INT PRIMARY KEY,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY(cust_id)references customer(customer_id) ON DELETE SET NULL -- ON DELETE CASCADE
    ); 
    
    INSERT INTO order_details
    VALUES (101,'2019-05-12',1);
    
    INSERT INTO order_details
    VALUES (105,'2019-05-15',1);
           
    
    SELECT * FROM order_details;
    
    DELETE FROM customer WHERE Customer_id=1;
    
    
    -- REPLACE 
    
    REPLACE INTO customer(Customer_id,pincode) -- PK is needed naito find kese hoga user -- ID , PINCODE K ALAWA SAB NULL
    VALUES (2,1200);
    
    REPLACE INTO customer(Customer_id,tname,pincode) -- ESI KOI ,PK HI NAHI HE SO WESI ENTRY BAN JAEGI 
    VALUES (7,'coder',1200);
    
    REPLACE INTO customer SET Customer_id=9,tname='Garima',gender='M',city='Delhi',pincode=1700; -- SYNTAX 2 --PEHLE ID MATCH HOGI
    
    select*from customer;
    REPLACE INTO customer(Customer_id,pincode) -- PK is needed naito find kese hoga user -- ID , PINCODE K ALAWA SAB NULL
    VALUES (2,1200);
    
    -- REPLACE VS UPDATE --> REPLACE ME NAI HUA DATA TO BAN JAEGA , UPDATE ME NAI HUA DATA TO KUCH NI HOGA
    
    
    -- JOINS ---
    -- MERGING 2 OR MORE TABLES BY MERGING THEIR PK,FK RELATION , GIVES RESULTANT TABLE
    
    -- INNER JOIN --> AFTER MERGING GIVES ONLY MATCHED PART --> COMMON ENTRIES OF T1 AND T2
    -- SYNTAX :- SELECT c.*,o.* FROM customer AS c INNER JOIN order_details AS o ON c.customer_id=o.cust_id;
    
    
    -- empID is foreign key
    -- Enlist all employee  ID's, name along with the project allocated to them
     select * from employee as e INNER JOIN project as p ON e.id=p.empID; -- > gives : both tables merged data --> 
     select e.id , e.fname,e.lname,p.id,p.name from employee as e INNER JOIN project as p ON e.id=p.empID; -- > gives only mentioned data merged from both table
     select e.id , e.fname,e.lname,p.id,p.name from employee as e , project as p WHERE e.id=p.empID; -- diff syntax same output , without inner join
     
     
     -- Fetch out all emp id's and their contact details who have been working from jaipur with the client name working in hyderabad
     select e.id , e.PhoneNo,e.emailID,c.fname,c.lname from employee as e INNER JOIN client as c ON e.id=c.empID WHERE e.city='jaipur' & c.city='hyderabad';
     
     
    
    -- OUTER JOIN --> LEFT JOIN --> ALL DATA OF T1 AND COMMON  DATA WITH T2, CORRESPONDING TO NON-COMMON DATA OF T1 , NULL WILL BE SET FOR T2 ENTRIES/DATA
                     -- > SELECT c.*,o.* FROM customer AS c LEFT JOIN order_details AS o ON c.customer_id=o.cust_id;
                     
                     -- fetch out each project allocated to each employee
                     select*from employee as e LEFT JOIN Project as p ON e.id=p.empID;
                     
                     
				-- > RIGHT JOIN --> ALL DATA OF T2 AND COMMON  DATA WITH T1, CORRESPONDING TO NON-COMMON DATA OF T2 , NULL WILL BE SET FOR T1 ENTRIES/DATA
                -- > SELECT c.*,o.* FROM customer AS c RIGHT JOIN order_details AS o ON c.customer_id=o.cust_id;
                
                -- list out all projects along with the employee's name  and their rescpective email id
                select p.id,p.name,e.fname,e.lname,e.emailID from employee as e RIGHT JOIN project as p ON e.id=p.empID;
                
                -- > FULL JOIN --> UNION OF LEFT JOIN AND RIGHT JOIN --> NO RSERVED KEYWORD AS FULL JOIN --> PERFORM 'UNION' OF LEFT JOIN AND RIGHT JOIN TO ACHIEVE FULL JOIN
                -- > SELECT c.*,o.* FROM customer AS c LEFT JOIN order_details AS o ON c.customer_id=o.cust_id 
                --   UNION 
                --   SELECT c.*,o.* FROM customer AS c RIGHT JOIN order_details AS o ON c.customer_id=o.cust_id;
                
	-- CROSS / CARTESIAN JOIN --> GIVES ALL POSSIBLE MATCHES --> NOT IMP
    
    -- SELF JOIN
    -- >syntax:- SELECT e1.id , e2.id,e2.name from employee as e1 INNER JOIN employee as e2 ON e1.id=e2.id;
    
    -- SET OPERATIONS
    -- combine rows / combine select statements / cols need to be same
     -- JOIN VS UNION
     -- join --> cols increases --> combine horizontally
     -- union --> rows increses ( jinka union kar rhe he unke cols ka data type same hona chahiye also number of entries b same) --> combine vertically
     select * from t1 UNION select * from t2;
     
     
     -- INTERSECT 
     select DISTINCT id from t1 INNER JOIN t2 using(id);
     select DISTINCT id from t1 INNER JOIN t2 ON t1.id=t2.id; -- same
     
     -- MINUS
     select id from t1  LEFT JOIN t2 using (id) WHERE t2.id is NULL; 
     
     -- SET OPERATIONS
     -- list out all the employees in company
     select * from dept1 
     UNION 
     select * from dept2;
     
     -- list out all the employees who works a salesman
     select * from dept1 WHERE role='salesman'
     UNION 
     select * from dept2 WHERE role='salesman';
     
     -- list out all emp who works for both department 
     select dept1.* from dept1 INNER JOIN dept2 USING(id);
     
     -- list out all emp who works in department 1 but not in department 2
     select dept1.* from dept1 LEFT JOIN dept2 USING(empid)
     WHERE dept2.empid is NULL;
     
     -- SUB QUERIES -- NESTED QUERY
     
     -- emp with age>30
     select * from employee where age in (select age from employee where age>30);
     
      -- emp working in more than 1 project
      select * from employee where id in(
      select empId from project group by empID having count(empId)>1
      );
      
      -- emp having age > avg(age)
      select * from employee where age>(select avg(age) from employee); 
      
      -- select max age person whose first name contains 'a'
      select max(age) from (select * from employee where fname like '%a%' ) as temp; -- > last wala part is madnatory -- > derived wala kuch  scene he
      
      -- corelated subquery
      -- find 3rd oldest employee
      SELECT *
      FROM employee e1
      WHERE 3=(
      SELECT COUNT(e2.age)
      FROM employee e2
      WHERE e2.age >= e1.age
      );
      
      -- VIEWS
      select * from worker;
      
      -- creating view
      CREATE VIEW custom_view AS select FIRST_NAME , LAST_NAME FROM worker;
      
      -- viewing from view
      select * from custom_view;
      
      -- ALTERING VIEW
      ALTER VIEW custom_view AS SELECT salary,FIRST_NAME from worker;
      
      -- DROPING THE VIEW
      DROP VIEW IF EXISTS custom_view;
      
      