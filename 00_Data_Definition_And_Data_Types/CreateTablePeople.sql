CREATE TABLE People
(
 Id int UNIQUE IDENTITY,
 Name varchar(200) NOT NULL,
 Picture varbinary(Max),
 Height float(2),
 Weight float(2),
 Gender char(1),
 Birthdate date NOT NULL,
 Biography nvarchar(Max),
 CONSTRAINT PK_People Primary Key(Id),
 CONSTRAINT CK_People_Gender Check(Gender='m' OR Gender ='f')
)

INSERT INTO People (Name, Picture, Height, Weight, Gender, Birthdate, Biography)
Values
		('John',01111101, 1.45, 88.99, 'm', '2003/04/29', 'TestBiography'),
		('Doe',01111101, 1.69, 88.78, 'f', '2003/05/29', 'TestBiography1'),
		('John1',01111101, 1.45, 88.33, 'm', '2003/06/05', 'TestBiography2'),
		('Doe1',01111101, 1.96, 88.77, 'f', '2003/07/29', 'TestBiography3'),
		('John2',01111101, 1.84, 88.25, 'm', '2003/08/29', 'TestBiography4')