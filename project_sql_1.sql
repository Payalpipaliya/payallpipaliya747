

-- Project 1.

--CREATE DATABASE.

CREATE DATABASE DATA_DIGGER;

USE DATA_DIGGER;

CREATE TABLE customers(
    -> customerID INT PRIMARY KEY,
    -> Name VARCHAR(20) NOT NULL,
    -> Email VARCHAR(50) NOT NULL,
    -> Address VARCHAR(50) NOT NULL
    -> );

     

     INSERT INTO customers(customerID, Name, Email, Address)
    -> VALUES(101, 'Payal', 'pipaliyapayal53@gmail.com', 'Rajkot'),
    -> (102, 'Prachi', 'prachibhalodi@21gmail.com', 'Rajkot'),
    -> (103, 'Diya', 'Diya23@gmail.com', 'Junagadh'),
    -> (104, 'Dev', 'Dev23@gmail.com', 'Ider'),
    -> (105, 'Vishal', 'Vishall45@gmail.com', 'Surendranagar');

    SELECT* FROM customers;
+------------+--------+---------------------------+---------------+
| customerID | Name   | Email                     | Address       |
+------------+--------+---------------------------+---------------+
|        101 | Payal  | pipaliyapayal53@gmail.com | Rajkot        |
|        102 | Prachi | prachibhalodi@21gmail.com | Rajkot        |
|        103 | Diya   | Diya23@gmail.com          | Junagadh      |
|        104 | Dev    | Dev23@gmail.com           | Ider          |
|        105 | Vishal | Vishall45@gmail.com       | Surendranagar |
+------------+--------+---------------------------+---------------+

UPDATE customers
    -> SET Address = 'Gondal'
    -> WHERE customerID = 101;

    DELETE FROM customers WHERE customerID = 101;

     SELECT * FROM customers WHERE Name = 'Diya';
+------------+------+------------------+----------+
| customerID | Name | Email            | Address  |
+------------+------+------------------+----------+
|        103 | Diya | Diya23@gmail.com | Junagadh |


-- ===============================================================================================================================
CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL(20) ,
    orderdate DATE,
    TotalAmount INT
);

INSERT INTO  Orders(OrderID, CustomerID, Orderdate, TotalAmount)
    -> VALUES(1, '101', '2026-01-18', 50000),
    -> (2, '102', '2026-02-14', 60000),
    -> (3, '101', '2026-03-12', 15000),
    -> (4, '103', '2026-02-11', 12000),
    -> (5, '101', '2026-01-12', 11000);

    SELECT* FROM Orders WHERE CustomerID = '101';
+---------+------------+------------+-------------+
| OrderID | CustomerID | Orderdate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |        101 | 2026-01-18 |       50000 |
|       3 |        101 | 2026-03-12 |       15000 |
|       5 |        101 | 2026-01-12 |       11000 |
+---------+------------+------------+-------------+

 UPDATE Orders
    -> SET TotalAmount = 11000
    -> WHERE OrderID = 1;

    SELECT * FROM Orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | Orderdate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |        101 | 2026-01-18 |       11000 |
|       2 |        102 | 2026-02-14 |       60000 |
|       3 |        101 | 2026-03-12 |       15000 |
|       4 |        103 | 2026-02-11 |       12000 |
|       5 |        101 | 2026-01-12 |       11000 |
+---------+------------+------------+-------------+

 DELETE FROM Orders
    -> WHERE OrderID = 1;

     SELECT *
    -> FROM Orders
    -> WHERE Orderdate >= CURDATE() - INTERVAL 30 DAY;
+---------+------------+------------+-------------+
| OrderID | CustomerID | Orderdate  | TotalAmount |
+---------+------------+------------+-------------+
|       2 |        102 | 2026-02-14 |       60000 |
|       3 |        101 | 2026-03-12 |       15000 |
|       4 |        103 | 2026-02-11 |       12000 |
|       5 |        101 | 2026-01-12 |       11000 |
+---------+------------+------------+-------------+

SELECT
    -> MAX(totalamount) AS highest_amount,
    -> MIN(totalamount) AS lowest_amount,
    -> AVG(totalamount) AS average_amount
    -> FROM Orders;
+----------------+---------------+----------------+
| highest_amount | lowest_amount | average_amount |
+----------------+---------------+----------------+
|          60000 |         11000 |     24500.0000 |
+----------------+---------------+----------------+


-- =================================================================================================================================

CREATE TABLE Products(
    -> ProductID INT PRIMARY KEY,
    -> ProductName VARCHAR(20) NOT NULL,
    -> Price INT NOT NULL,
    -> Stock INT NOT NULL
    -> );

    INSERT INTO Products(
    -> ProductID, ProductName, Price, Stock)
    -> VALUES
    -> (1, 'Mobile', 20000, 2),
    -> (2, 'Laptop', 50000, 3),
    -> (3, 'Charger', 2000, 5),
    -> (4, 'Pandrive', 1200, 6),
    -> (5, 'Keyboard', 3000, 4);

     SELECT* FROM Products;
+-----------+-------------+-------+-------+
| ProductID | ProductName | Price | Stock |
+-----------+-------------+-------+-------+
|         1 | Mobile      | 20000 |     2 |
|         2 | Laptop      | 50000 |     3 |
|         3 | Charger     |  2000 |     5 |
|         4 | Pandrive    |  1200 |     6 |
|         5 | Keyboard    |  3000 |     4 |
+-----------+-------------+-------+-------+

SELECT* FROM Products ORDER BY Price DESC;
+-----------+-------------+-------+-------+
| ProductID | ProductName | Price | Stock |
+-----------+-------------+-------+-------+
|         2 | Laptop      | 50000 |     3 |
|         1 | Mobile      | 20000 |     2 |
|         5 | Keyboard    |  3000 |     4 |
|         3 | Charger     |  2000 |     5 |
|         4 | Pandrive    |  1200 |     6 |
+-----------+-------------+-------+-------+

 UPDATE Products
    -> SET Price = 12000
    -> WHERE ProductID = 1
    -> ;

    
     DELETE FROM Products
    -> WHERE Stock = 0;

     SELECT*  FROM Products
    -> WHERE Price BETWEEN 500 AND 2000;
+-----------+-------------+-------+-------+
| ProductID | ProductName | Price | Stock |
+-----------+-------------+-------+-------+
|         3 | Charger     |  2000 |     5 |
|         4 | Pandrive    |  1200 |     6 |
+-----------+-------------+-------+-------+

SELECT MAX(price) AS expensive_products,
    -> MIN(price) AS cheapest_products
    -> FROM Products;
+--------------------+-------------------+
| expensive_products | cheapest_products |
+--------------------+-------------------+
|              50000 |              1200 |
+--------------------+-------------------+

-- ===============================================================================================================================

CREATE Table Orderdetails(
    -> OrderDetail_ID INT PRIMARY KEY AUTO_INCREMENT,
    -> OrderID INT NOT NULL,
    -> ProductID INT NOT NULL,
    -> Quantity INT NOT NULL,
    -> Sub_total INT
    -> );

     INSERT INTO Orderdetails(OrderDetail_ID, OrderID, ProductID, Quantity, Sub_total)
    -> VALUES(1, 101, 501, 2, 400),
    -> (2, 102, 502, 4, 200),
    -> (3, 103, 503, 5, 200),
    -> (4, 104, 504, 6, 400),
    -> (5, 106, 50, 9, 600);

    SELECT* FROM OrderDetails
    -> WHERE OrderID = 102;
+----------------+---------+-----------+----------+-----------+
| OrderDetail_ID | OrderID | ProductID | Quantity | Sub_total |
+----------------+---------+-----------+----------+-----------+
|              2 |     102 |       502 |        4 |       200 |
+----------------+---------+-----------+----------+-----------+

SELECT SUM(sub_total) AS TotalRevenue
    -> FROM Orderdetails;
+--------------+
| TotalRevenue |
+--------------+
|         1800 |
+--------------+

SELECT ProductID, SUM(quantity) AS total_quantity
    -> FROM OrderDetailS
    -> GROUP BY ProductID
    -> ORDER BY total_quantity DESC
    -> LIMIT 3;
+-----------+----------------+
| ProductID | total_quantity |
+-----------+----------------+
|        50 |              9 |
|       504 |              6 |
|       503 |              5 |
+-----------+----------------+


SELECT ProductID, COUNT(*) AS sold
    -> FROM OrderDetails
    -> WHERE ProductID = 3;
+-----------+------+
| ProductID | sold |
+-----------+------+
|      NULL |    0 |
+-----------+------+


