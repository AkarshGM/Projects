-- Task 1 Create a databse to store and manage sales records

CREATE DATABASE IF NOT EXISTS stylexcarz_db;

-- Task 2 Create three tables to store data

Use stylexcarz_db;
CREATE TABLE salesperson
(salespersonid INT PRIMARY KEY,
salesperson_name varchar(50) NOT NULL,
salesperson_city varchar (50) NOT NULL,
commission_rate varchar (50) NOT NULL);

CREATE TABLE customers
(customerid INT PRIMARY KEY,
c_firstname varchar (50) NOT NULL,
c_lastname varchar (50) NOT NULL,
c_city varchar (50) NOT NULL,
c_rating varchar (50) NOT NULL);

CREATE TABLE orders
(orderid INT PRIMARY KEY,
amount INT,
orderdate DATE,
salespersonid INT,
 FOREIGN KEY (salespersonid) REFERENCES stylexcarz_db.salesperson(salespersonid),
 customerid INT,
 FOREIGN KEY (customerid) REFERENCES stylexcarz_db.customers(customerid));
 
 -- Task 3 Insert the data into the tables
 
INSERT INTO salesperson(salespersonid, salesperson_name, salesperson_city, commission_rate)
     VALUES (1001, "William", "New York", 12),
            (1002, "Liam", "New Jersey", 13),
            (1003, "Axelrod", "San Jose", 10),
            (1004, "James", "San Diego", 11),
            (1005, "Fran", "Austin", 26),
            (1007, "Oliver", "New York", 15),
            (1008, "John", "Atlanta", 2),
            (1009, "Charles", "New Jersey", 2);
            
 INSERT INTO customers (customerid, c_firstname, c_lastname, c_city, c_rating)
      VALUES (2001, "Anny", "Hoffman", "New York", 1),
			 (2002, "Jenny", "Giovanni", "New Jersey", 2),
             (2003, "Williams", "Liu", "San Jose", 3),
             (2004, "Harry", "Grass", "San Diego", 3),
             (2005, "John", "Clemens", "Austin", 4),
             (2006, "Fanny", "Cisneros", "New York", 4),
             (2007, "Jonathan", "Pereira", "Atlanta", 3);
             
 INSERT INTO orders (orderid, amount, orderdate, salespersonid, customerid)
	  VALUES (3001, 23, "2020-02-01", 1009, 2007),
             (3002, 20, "2021-02-23", 1007, 2007),
             (3003, 89, "2021-03-06", 1002, 2002),
             (3004, 67, "2021-04-02", 1004, 2002),
             (3005, 30, "2021-07-30", 1001, 2007),
             (3006, 35, "2021-09-18", 1001, 2004),
             (3007, 19, "2021-10-02", 1001, 2001),
             (3008, 21, "2021-10-09", 1003, 2003),
             (3009, 45, "2021-10-10", 1009, 2005);
             
 -- Task 4 Update the commission
 
 Use stylexcarz_db;
 UPDATE salesperson SET commission_rate = "15" WHERE commission_rate>0 and commission_rate<15;
 
 -- Task 5 Create a Backup of orders table in new database
 
 CREATE DATABASE IF NOT EXISTS orders_backup;
 Use orders_backup;
 CREATE TABLE IF NOT EXISTS orders_bkp SELECT * FROM stylexcarz_db.orders;
 
 -- Task 6 Increase rating of customers with orders more than one
 
 Use stylexcarz_db;
 UPDATE customers SET c_rating = c_rating + 3 WHERE customerid = "2002";
 UPDATE customers SET c_rating = c_rating + 3 WHERE customerid = "2007";
 
 -- All tasks are completed
 

 
 

             
      