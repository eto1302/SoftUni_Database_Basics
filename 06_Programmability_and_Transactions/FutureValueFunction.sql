CREATE FUNCTION ufn_CalculateFutureValue(@sum DECIMAL(19,8), @rate DECIMAL(19,8), @years INT)
RETURNS DECIMAL(19,4)
AS 
BEGIN
	DECLARE @result DECIMAL(19,4);
	SET @result = @sum * (POWER((1 + @rate), @years))
	RETURN @result
END