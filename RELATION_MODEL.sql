<<<<<<< HEAD
--create database
CREATE DATABASE RELATION_MODEL
USE RELATION_MODEL

--CREATE TABLE SUPPLIERS 
CREATE TABLE Suppliers
 (SupplierId INT PRIMARY KEY,
  DeliveryDate VARCHAR(50) NOT NULL,
  DeliveryId VARCHAR(50) NOT NULL);
  

--CREATE TABLE ORDERS
CREATE TABLE Orders (
OrderId INT PRIMARY KEY,
OrderDate DATE NOT NULL,
HeadQuartersId VARCHAR NOT NULL
   );
  


--CREATE TABLE ORDER DETAILS 
CREATE TABLE OrderDetails
  (OrderDetailId INT PRIMARY KEY,
  OrderId INT,
  ProductId INT,
  ProductQuantity INT NOT NULL,
  FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
  FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);


--CREATE TABLE PRODUCTS  
CREATE TABLE Products
 (ProductId INT PRIMARY KEY);
 

---CREATE DELIVERY TABLE 
CREATE TABLE DeliverY
 (DeliveryId INT PRIMARY KEY,
  DeliveryDate DATE NOT NULL,
  SupplierId INT,
  FOREIGN KEY (SupplierId) REFERENCES Suppliers(SupplierId)
);




--Explanation:
--The Suppliers table has a primary key SupplierId and a foreign key deliveryID that reference the Delivery table 

-- The Orders table has a primary key OrderId, an attribute OrderDate, headquartersID

--The OrderDetails table has a primary key OrderDetailId, foreign keys OrderId and ProductId that reference the Orders and Products tables, respectively, and an attribute ProductQuantity.

--The Products table has a primary key ProductId.

--The Delivery table has a primary key DeliveryId, an attribute DeliveryDate, and a foreign key SupplierId that references the Suppliers table.



=======
--create database
CREATE DATABASE RELATION_MODEL
USE RELATION_MODEL

--CREATE TABLE SUPPLIERS 
CREATE TABLE Suppliers
 (SupplierId INT PRIMARY KEY,
  DeliveryDate VARCHAR(50) NOT NULL,
  DeliveryId VARCHAR(50) NOT NULL);
  

--CREATE TABLE ORDERS
CREATE TABLE Orders (
OrderId INT PRIMARY KEY,
OrderDate DATE NOT NULL,
HeadQuartersId VARCHAR NOT NULL
   );
  


--CREATE TABLE ORDER DETAILS 
CREATE TABLE OrderDetails
  (OrderDetailId INT PRIMARY KEY,
  OrderId INT,
  ProductId INT,
  ProductQuantity INT NOT NULL,
  FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
  FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);


--CREATE TABLE PRODUCTS  
CREATE TABLE Products
 (ProductId INT PRIMARY KEY);
 

---CREATE DELIVERY TABLE 
CREATE TABLE DeliverY
 (DeliveryId INT PRIMARY KEY,
  DeliveryDate DATE NOT NULL,
  SupplierId INT,
  FOREIGN KEY (SupplierId) REFERENCES Suppliers(SupplierId)
);




--Explanation:
--The Suppliers table has a primary key SupplierId and a foreign key deliveryID that reference the Delivery table 

-- The Orders table has a primary key OrderId, an attribute OrderDate, headquartersID

--The OrderDetails table has a primary key OrderDetailId, foreign keys OrderId and ProductId that reference the Orders and Products tables, respectively, and an attribute ProductQuantity.

--The Products table has a primary key ProductId.

--The Delivery table has a primary key DeliveryId, an attribute DeliveryDate, and a foreign key SupplierId that references the Suppliers table.



>>>>>>> 364949a7bfdffa2bac641b902f856eaf2324064c
