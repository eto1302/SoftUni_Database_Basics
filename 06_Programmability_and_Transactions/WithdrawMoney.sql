CREATE PROCEDURE usp_WithdrawMoney (@accountId int, @withdrawAmount money)
AS
BEGIN
  BEGIN TRANSACTION
  UPDATE Accounts
  SET Balance -= @withdrawAmount
  WHERE Id = @accountId

  IF (@@ROWCOUNT <> 1)
  BEGIN
    ROLLBACK;
	RAISERROR ('Invalid account!', 16, 1);
	RETURN;
  END
  COMMIT;
END