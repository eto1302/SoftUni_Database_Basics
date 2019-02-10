CREATE PROC usp_GetTownsStartingWith(@input varchar(max))
AS  
  SELECT Name AS Town
  FROM Towns
  WHERE Name LIKE CONCAT(@input, '%')
