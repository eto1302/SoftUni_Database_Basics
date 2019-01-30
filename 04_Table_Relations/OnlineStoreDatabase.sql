CREATE DATABASE Store

CREATE TABLE Cities
(
CityID int PRIMARY KEY IDENTITY,
Name varchar(50)
)

CREATE TABLE ItemTypes
(
ItemTypeID int PRIMARY KEY IDENTITY,
Name varchar(50)
)

CREATE TABLE Items
(
ItemID int PRIMARY KEY IDENTITY,
Name varchar(50),
ItemTypeID int,
CONSTRAINT FK_ITEM_TYPE
FOREIGN KEY (ItemTypeID)
REFERENCES ItemTypes(ItemTypeID)
)

CREATE TABLE Customers
(
CustomerID int PRIMARY KEY IDENTITY,
Name varchar(50),
Birthday date,
CityID int,
CONSTRAINT FK_City_Customer
FOREIGN KEY (CityID)
REFERENCES Cities(CityID)
)

CREATE TABLE Orders
(
OrderID int PRIMARY KEY IDENTITY,
CustomerID int,
CONSTRAINT FK_Customer_Order
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)
)

CREATE TABLE OrderItems
(
OrderID int,
ItemID int,
CONSTRAINT PK_OrderItems
PRIMARY KEY(OrderID, ItemID),
CONSTRAINT FK_Order_Item
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID),
CONSTRAINT FK_Item_Order
FOREIGN KEY (ItemID)
REFERENCES Items(ItemID)
)