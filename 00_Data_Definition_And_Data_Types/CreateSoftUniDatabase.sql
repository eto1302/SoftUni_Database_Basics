--CREATE DATABASE SoftUni

--DROP TABLE Towns
--DROP TABLE Addresses
--DROP TABLE Departments
--DROP TABLE Employees

CREATE TABLE Towns 
(
Id int NOT NULL PRIMARY KEY IDENTITY,
Name varchar(20) NOT NULL
)

CREATE TABLE Addresses 
(
Id int NOT NULL PRIMARY KEY IDENTITY, 
AddressText varchar(200) NOT NULL, 
TownId int NOT NULL
)

CREATE TABLE Departments 
(
Id int NOT NULL PRIMARY KEY IDENTITY, 
Name varchar(200) NOT NULL
)

CREATE TABLE Employees 
(
Id int NOT NULL PRIMARY KEY IDENTITY, 
FirstName varchar(20) NOT NULL, 
MiddleName varchar(20) NOT NULL, 
LastName varchar(20) NOT NULL, 
JobTitle varchar(20) NOT NULL, 
DepartmentId int NOT NULL,
HireDate date NOT NULL, 
Salary float(2) NOT NULL, 
AddressId int 
)