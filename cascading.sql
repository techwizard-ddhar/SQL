CREATE DATABASE CASCADING;

USE CASCADING;

CREATE TABLE Employee (
 emp_id int(10) NOT NULL,
 name varchar(40) NOT NULL,
 birthdate date NOT NULL,
 gender varchar(10) NOT NULL,
 hire_date date NOT NULL,
 PRIMARY KEY (emp_id) );
 
 INSERT INTO Employee (emp_id, name, birthdate, gender, hire_date) VALUES
 (101, 'Bryan', '1988-08-12', 'M', '2015-08-26'),
 (102, 'Joseph', '1978-05-12', 'M', '2014-10-21'),
 (103, 'Mike', '1984-10-13', 'M', '2017-10-28'),
 (104, 'Daren', '1979-04-11', 'M', '2006-11-01'),
 (105, 'Marie', '1990-02-11', 'F', '2018-10-12');
 
 SELECT * FROM EMPLOYEE; -- 5
----------------------------------------------------------------------------------

CREATE TABLE Payment (
 payment_id int(10) PRIMARY KEY NOT NULL,
 emp_id int(10) NOT NULL,
 amount float NOT NULL,
 payment_date date NOT NULL,
 --  FOREIGN KEY (emp_id) REFERENCES Employee (emp_id) ON DELETE CASCADE);
 FOREIGN KEY (emp_id) REFERENCES Employee (emp_id) -- ON DELETE CASCADE ON UPDATE CASCADE
 );
 
INSERT INTO Payment (payment_id, emp_id, amount, payment_date) VALUES
 (301, 101, 1200, '2015-09-15'),
 (302, 101, 1200, '2015-09-30'),
 (303, 101, 1500, '2015-10-15'),
 (304, 101, 1500, '2015-10-30'),
 (305, 102, 1800, '2015-09-15'),
 (306, 102, 1800, '2015-09-30');
 
 SELECT * FROM PAYMENT; -- 6
 -------------------------------------------------------------------------------------
 CREATE TABLE DD_EMPLOYEE_PAYMENT_MASTER AS
 SELECT emp.emp_id, emp.name, pay.payment_id, pay.amount, pay.payment_date, emp.gender, emp.hire_date,
 emp.birthdate
 FROM Payment As pay
 LEFT OUTER JOIN Employee As emp ON pay.emp_id = emp.emp_id;
 
 -- i want to craete a master table of Employee
 CREATE TABLE DD_EMPLOYEE_PAYMENT_MASTER AS
 SELECT emp.emp_id, emp.name, pay.payment_id, pay.amount, pay.payment_date, emp.gender, emp.hire_date,
 emp.birthdate
 FROM Employee As emp
 LEFT OUTER JOIN Payment As pay ON pay.emp_id = emp.emp_id;
 
 SELECT * FROM DD_EMPLOYEE_PAYMENT_MASTER;
 
 --------------------------------------------------------------------------
 Delete From Employee Where emp_id = 102;
 
 select * from employee;
 select * from payment;
 --------------------------------------------------------------------------
 USE information_schema;
 
 SELECT table_name FROM referential_constraints
 WHERE constraint_schema = 'CASCADING'
 AND referenced_table_name = 'Employee'
 AND delete_rule = 'CASCADE';
 
 --------------------------------------------------------------------------
-- update can cause violation on referenced table.
 UPDATE Employee SET emp_id = 100 WHERE emp_id = 101;
 
 --------------------------------------------------------------------------
-- update can cause violation on referencing table.
UPDATE Payment SET emp_id = 100 WHERE emp_id = 102;

--------------------------------------------------------------------------
-- insert may cause violation on referencing table
INSERT INTO Payment (payment_id, emp_id, amount, payment_date) VALUES
 (309, 106, 1200, '2015-09-15');


 