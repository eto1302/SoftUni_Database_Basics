CREATE TABLE Users
(
 Id int UNIQUE IDENTITY,
 Username varchar(30) NOT NULL UNIQUE,
 Password varchar(26) NOT NULL UNIQUE,
 ProfilePicture varbinary(900),
 IsDeleted bit DEFAULT 0,
 LastLogin datetime,
 CONSTRAINT PK_Users Primary Key(Id),
)

INSERT INTO Users (Username, Password, ProfilePicture, IsDeleted, LastLogin)
Values
		('John','pass',01111101,  0, '2003/04/29 15:01:50'),
		('Doe','pass1',01111101,  0, '2003/04/29 15:01:50'),
		('John1','pass2',01111101,  0, '2003/04/29 15:01:50'),
		('Doe1','pass3',01111101,  0, '2003/04/29 15:01:50'),
		('John2','pass4',01111101,  0, '2003/04/29 15:01:50')