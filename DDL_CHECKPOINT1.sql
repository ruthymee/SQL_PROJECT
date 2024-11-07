---CREATING DATABASE DDL_CHECKPOINT1
CREATE DATABASE DDL_CHECKPOINT1

--CREATING TABLE customers
CREATE TABLE Customers (CustomerID INT PRIMARY KEY NOT NULL,
                        FirstName VARCHAR(50) NOT NULL,
                        LastName  VARCHAR(50) NOT NULL,
                        Email     VARCHAR(50) NOT NULL,
                        Phone     VARCHAR(50) NOT NULL,
                       Add_ress    VARCHAR(50) NOT NULL,
                       City        VARCHAR(50) NOT NULL,
                       State_      VARCHAR(50) NOT NULL,
                       ZipCode     VARCHAR(50) NOT NULL);

---CREATE TABLE Categories
CREATE TABLE Categories(CategoryID INT Primary Key NOT NULL,
                        CategoryName VARCHAR NOT NULL,
                        Description  VARCHAR NOT NULL);

--CREATING TABLE products
CREATE TABLE Products ( ProductID INT Primary Key NOT NULL,
                        ProductName VARCHAR(50) NOT NULL,
                        Description VARCHAR(50)  NOT NULL,
                        Price        INT NOT NULL,
                       StockQuantity  VARCHAR NOT NULL,
					   CategoryID INT NOT NULL, FOREIGN KEY(CategoryID) REFERENCES Categories(CategoryID));

--CREATE TABLE ORDERS
CREATE TABLE Orders(OrderID INT Primary Key NOT NULL,
                    CustomerID INT NOT NULL, 
					Foreign Key(CustomerID) REFERENCES Customers(CustomerID),
                    OrderDate INT NOT NULL,
					TotalAmount INT NOT NULL);

--CREATE TABLE ORDERDETAILS
CREATE TABLE OrderDetails(OrderDetailID INT Primary Key NOT NULL,
                          OrderID INT NOT NULL, FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
                          ProductID INT NOT NULL FOREIGN KEY(ProductID) REFERENCES Products(ProductID),
                          Quantity INT NOT NULL,
                          UnitPrice INT NOT NULL);

--RETRIEVING ALL THE CREATED TABLES
SELECT * FROM Customers
SELECT * FROM Categories
SELECT * FROM Products
SELECT * FROM Orders
SELECT * FROM OrderDetails
