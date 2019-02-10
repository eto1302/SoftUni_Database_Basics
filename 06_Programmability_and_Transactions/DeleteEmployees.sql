USE SoftUni
CREATE TABLE Deleted_Employees
(
	EmployeeId INT NOT NULL IDENTITY, 
	FirstName NVARCHAR(64) NOT NULL, 
	LastName NVARCHAR(64) NOT NULL, 
	MiddleName NVARCHAR(64), 
	JobTitle NVARCHAR(64) NOT NULL, 
	DepartmentID INT NOT NULL, 
	Salary DECIMAL(15, 2) NOT NULL

	CONSTRAINT PK_Deleted_Emp
	PRIMARY KEY (EmployeeId), 

	CONSTRAINT FK_DeletedEmp_Departments
	FOREIGN KEY (DepartmentID)
	REFERENCES Departments(DepartmentID)
)
GO

CREATE TRIGGER tr_DeletedEmp 
ON Employees 
AFTER DELETE 
AS
	INSERT INTO Deleted_Employees
	SELECT 	
		d.FirstName, 
		d.LastName, 
		d.MiddleName, 
		d.JobTitle, 
		d.DepartmentID, 
		d.Salary
	FROM deleted as d