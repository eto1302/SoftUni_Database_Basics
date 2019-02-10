CREATE PROC usp_ChangeJourneyPurpose(@JourneyId INT, @NewPurpose VARCHAR(MAX))
AS
BEGIN
     DECLARE @cnt  INT = (SELECT COUNT(Id) FROM Journeys WHERE @JourneyId = Id);
	 IF(@cnt = 0) 
	 BEGIN 
	 RAISERROR('The journey does not exist!', 16, 1); 
	 END
	 DECLARE @prps varchar(max) = (SELECT Purpose FROM Journeys WHERE @JourneyId = Id);
	 IF(@prps = @NewPurpose) 
	 BEGIN 
	 RAISERROR('You cannot change the purpose!', 16, 1); 
	 END
	 UPDATE Journeys 
	 SET Purpose = @NewPurpose
	 WHERE Id = @JourneyId
END
