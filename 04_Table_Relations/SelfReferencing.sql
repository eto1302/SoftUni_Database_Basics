CREATE TABLE Teachers(
TeacherID int PRIMARY KEY IDENTITY,
Name varchar(20),
ManagerID int,
CONSTRAINT FK_Teacher_Manager
FOREIGN KEY (ManagerID)
REFERENCES Teachers(TeacherID)
)