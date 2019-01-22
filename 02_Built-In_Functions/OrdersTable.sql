USE Orders
SELECT ProductName,
OrderDate,
DATEADD(DAY, 3, OrderDate) AS [Pay Due],
DATEADD(Month, 1, OrderDate) AS [Deliver Due]
FROM Orders