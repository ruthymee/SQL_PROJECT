CREATE DATABASE DQL_CHECKPOINT
ALTER DATABASE DQL_CHECKPOINT MODIFY NAME = DQL_CHECKPOINT1;
---CREATING TABLES
CREATE TABLE PRODUCTS(PRODUCT_ID VARCHAR(50) NOT NULL , PRODUCT_NAME VARCHAR(50) NOT NULL, PRODUCT_TYPE VARCHAR(50) NOT NULL, PRICE FLOAT NOT NULL);
CREATE TABLE CUSTOMERS(CUSTOMER_ID VARCHAR(50) NOT NULL, CUSTOMER_NAME VARCHAR(50) NOT NULL, EMAIL VARCHAR(50) NOT NULL, PHONE VARCHAR(50) NOT NULL);
CREATE TABLE ORDERS(ORDER_ID VARCHAR(50) NOT NULL, CUSTOMER_ID VARCHAR(50) NOT NULL, ORDERDATE VARCHAR(50) NOT NULL);
CREATE TABLE ORDERDETAILS(ORDERDETAIL_ID VARCHAR(50), ORDER_ID VARCHAR(50) NOT NULL, PRODUCT_ID VARCHAR(50) NOT NULL, QUANTITY INT NOT NULL);
CREATE TABLE PRODUCT_TYPE(PRODUCT_TYPEID VARCHAR(20), PRODUCT_TYPENAME VARCHAR (20));

--INSERTING VALUES INTO THE TABLES CREATED
INSERT INTO PRODUCTS VALUES (1,'Widget A', 'Widget', 10.00),
                            (2, 'Widget B','Widget',  15.00),
                            (3, 'Gadget X','Gadget', 20.00),
                            (4, 'Gadget Y','Gadget',  25.00),
                            (5, 'Doohickey Z', 'Doohickey', 30.00);


INSERT INTO Customers VALUES ( 1, 'John Smith',  'john@example.com', '123-456-7890'),
                             (2, 'Jane Doe', 'jane.doe@example.com', '987-654-3210'),
                             (3, 'Alice Brown',  'alice.brown@example.com', '456-789-0123');


INSERT INTO Orders VALUES(101,1, '2024-05-01'),
                   ( 102,  2, '2024-05-02'),
				   (103, 3,'2024-05-01');


INSERT INTO ORDERDETAILS VALUES(1, 101, 1,  2),
                               ( 2,  101, 3, 1),
                                ( 3,  102,  2, 3 ),
								( 4,  102,  4,  2),
								 (5, 103, 5,  1);

INSERT INTO PRODUCT_TYPE VALUES (1,  'Widget'),
                                (2,  'Gadget'),
                                (3,  'Doohickey')

SELECT*FROM PRODUCTS
SELECT*FROM CUSTOMERS
SELECT*FROM ORDERS
SELECT*FROM ORDERDETAILS
SELECT*FROM PRODUCT_TYPE


---Retrieve the names of the products that have been ordered by at least one customer,
--along with the total quantity of each product ordered.
SELECT P.Product_Name, SUM(OD.Quantity) AS TotalQuantityOrdered
FROM Products P
JOIN OrderDetails OD ON P.Product_ID = OD.Product_ID
GROUP BY P.Product_Name;

--Retrieve the names of the customers who have placed an order on every day of the week,
--along with the total number of orders placed by each customer.
SELECT C.Customer_Name, COUNT(O.Order_ID) AS TotalOrders
FROM Customers C
JOIN Orders O ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_Name
HAVING COUNT(DISTINCT O.OrderDate) >= 5;

--Retrieve the names of the customers who have placed the most orders, along with the total number of orders placed by each customer.
SELECT C.Customer_Name, COUNT(O.Order_ID) AS TotalOrders
FROM Customers C
JOIN Orders O ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_Name
ORDER BY TotalOrders DESC

--Retrieve the names of the products that have been ordered the most, along with the total quantity of each product ordered.
SELECT P.Product_Name, SUM(OD.Quantity) AS TotalQuantityOrdered
FROM Products P
JOIN OrderDetails OD ON P.Product_ID = OD.Product_ID
GROUP BY P.Product_Name
ORDER BY TotalQuantityOrdered DESC;

--Retrieve the names of customers who have placed an order for at least one widget.
SELECT DISTINCT C.Customer_Name
FROM Customers C
JOIN Orders O ON C.Customer_ID = O.Customer_ID
JOIN OrderDetails OD ON O.Order_ID = OD.Order_ID
JOIN Products P ON OD.Product_ID = P.Product_ID
WHERE P.Product_Type = 'Widget';

--Retrieve the names of the customers who have placed an order for at least one widget and 
--at least one gadget, along with the total cost of the widgets and gadgets ordered by each customer.
SELECT C.Customer_Name, SUM(P.Price * OD.Quantity) AS TotalCost
FROM Customers C
JOIN Orders O ON C.Customer_ID = O.Customer_ID
JOIN OrderDetails OD ON O.Order_ID = OD.Order_ID
JOIN Products P ON OD.Product_ID = P.Product_ID
WHERE P.Product_Type IN ('Widget', 'Gadget')
GROUP BY C.Customer_Name
HAVING COUNT(DISTINCT CASE WHEN P.Product_Type = 'Widget' THEN P.Product_ID END) > 0
   AND COUNT(DISTINCT CASE WHEN P.Product_Type = 'Gadget' THEN P.Product_ID END) > 0;

----Retrieve the names of the customers who have placed an order for at least one gadget, 
--along with the total cost of the gadgets ordered by each customer.
SELECT C.Customer_Name, SUM(P.Price * OD.Quantity) AS TotalCostOfGadgets
FROM Customers C
JOIN Orders O ON C.Customer_ID = O.Customer_ID
JOIN OrderDetails OD ON O.Order_ID = OD.Order_ID
JOIN Products P ON OD.Product_ID = P.Product_ID
WHERE P.Product_Type = 'Gadget'
GROUP BY C.Customer_Name;


--
--Retrieve the names of the customers who have placed an order for at least one doohickey, along with 
--the total cost of the doohickeys ordered by each customer.
SELECT C.Customer_Name, SUM(P.Price * OD.Quantity) AS TotalCostOfDoohickeys
FROM Customers C
JOIN Orders O ON C.Customer_ID = O.Customer_ID
JOIN OrderDetails OD ON O.Order_ID = OD.Order_ID
JOIN Products P ON OD.Product_ID = P.Product_ID
WHERE P.Product_Type = 'Doohickey'
GROUP BY C.Customer_Name;


--Retrieve the names of the customers who have placed an order every day of the week, 
--along with the total number of orders placed by each customer.
SELECT C.Customer_Name, COUNT(O.Order_ID) AS TotalOrders
FROM Customers C
JOIN Orders O ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_Name
HAVING COUNT(DISTINCT O.OrderDate) >= 7;


--Retrieve the total number of widgets and gadgets ordered by each customer, along with the total cost of the orders.
SELECT C.Customer_Name, 
       SUM(CASE WHEN P.Product_Type = 'Widget' THEN OD.Quantity ELSE 0 END) AS TotalWidgets,
       SUM(CASE WHEN P.Product_Type = 'Gadget' THEN OD.Quantity ELSE 0 END) AS TotalGadgets,
       SUM(OD.Quantity * P.Price) AS TotalCost
FROM Customers C
JOIN Orders O ON C.Customer_ID = O.Customer_ID
JOIN OrderDetails OD ON O.Order_ID = OD.Order_ID
JOIN Products P ON OD.Product_ID = P.Product_ID
WHERE P.Product_Type IN ('Widget', 'Gadget')
GROUP BY C.Customer_Name;















