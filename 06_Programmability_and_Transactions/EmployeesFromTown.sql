CREATE PROC usp_GetEmployeesFromTown(@input varchar(max))
AS  
  SELECT FirstName, LastName
  FROM Employees AS e
  JOIN Addresses AS a ON a.AddressID = e.AddressID
  JOIN Towns as t ON t.TownID = a.TownID
  WHERE Name = @input
  