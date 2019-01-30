CREATE TABLE Students
(
StudentID int PRIMARY KEY IDENTITY,
Name varchar(200) NOT NULL
)

CREATE TABLE Exams
(
ExamID int PRIMARY KEY IDENTITY,
Name varchar(200) NOT NULL
)

CREATE TABLE StudentsExams
(
StudentID int,
ExamID int,

CONSTRAINT PK_StudentsExams
PRIMARY KEY(StudentID, ExamID),

CONSTRAINT FK_StudentsExams_Students
FOREIGN KEY(StudentID)
REFERENCES Students(StudentID),

CONSTRAINT PK_StudentsExams_Exams
FOREIGN KEY(ExamID)
REFERENCES Exams(ExamID),
)