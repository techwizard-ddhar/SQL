CREATE DATABASE DataFlair;
Use DataFlair;

CREATE TABLE DD_UK_BAK_CUSTOMERS(
	customer_id numeric(20),
    name varchar(20),
    surname varchar(20),
    gender char(1),
    age numeric(3),
    region varchar(30),
    job_classification varchar(50),
    date_joined date,
    balance decimal(10,3));
    
Load Data local infile
"C:/Users/KIIT/OneDrive/Documents/P6-UK-Bank-Customers.csv"
into table DD_UK_BAK_CUSTOMERS
fields terminated by ','
enclosed by '""'
lines terminated by '\n'
ignore 1 rows;

LOAD DATA LOCAL INFILE "C:/datasets/P6-UK-Bank-Customers.csv"
INTO TABLE DD_UK_BAK_CUSTOMERS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW GLOBAL VARIABLES LIKE 'local_infile';
set global local_infile = 1;

select * from DD_UK_BAK_CUSTOMERS;
-----------------------------------------------------------------------------------------
-- Step{1}.Using the Distinct Keyword to eliminate
--	duplicate values and count their
--	occurrences from the Query results.

select count(*) from DD_UK_BAK_CUSTOMERS; -- 4014

select distinct count(*) from DD_UK_BAK_CUSTOMERS; -- 4014, there is no duplicate entry

-----------------------------------------------------------------------------------------
select count(customer_id) from DD_UK_BAK_CUSTOMERS; -- 4014

select count(distinct customer_id) from DD_UK_BAK_CUSTOMERS; -- 4014, there is no duplicate sentry

select distinct customer_id from DD_UK_BAK_CUSTOMERS;
------------------------------------------------------------------------------------------
-- >> Step{2}.Using count and group by
select customer_id, name, age, count(*) As count
From DD_UK_BAK_CUSTOMERS
group by 1,2,3;

select age, count(*) As age_count
From DD_UK_BAK_CUSTOMERS
group by 1
having age_count > 1
order by 1;
--------------------------------------------------------------------------------------------
-- >> Step{3}.create a backup table

CREATE VIEW COPY_DATA AS SELECT distinct * FROM DD_UK_BAK_CUSTOMERS;

SELECT * FROM COPY_DATA;
--------------------------------------------------------------------------------------------
-- >> Step{4}.using joins to remove duplicate records

-- >> it will give duplicate record
select d1.region,
CONCAT(d1.name, ' ',d1.surname) As customer_1,
CONCAT(d2.name, ' ',d2.surname) As customer_2
FROM DD_UK_BAK_CUSTOMERS d1, DD_UK_BAK_CUSTOMERS d2
where d1.customer_id <> d2.customer_id AND d1.region = d2.region;

-- >> no duplicate record
select d1.region,
CONCAT(d1.name, ' ',d1.surname) As customer_1,
CONCAT(d2.name, ' ',d2.surname) As customer_2
FROM DD_UK_BAK_CUSTOMERS d1, DD_UK_BAK_CUSTOMERS d2
where d1.customer_id < d2.customer_id AND d1.region = d2.region
order by region;


