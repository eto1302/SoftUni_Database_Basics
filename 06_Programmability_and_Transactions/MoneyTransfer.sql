CREATE PROCEDURE usp_TransferMoney (@senderId int, @receiverId int, @transferAmount money)
AS
BEGIN 
  DECLARE @senderBalanceBefore money = (SELECT Balance FROM Accounts WHERE Id = @senderId);
  IF(@senderBalanceBefore IS NULL)
  BEGIN
    RAISERROR('Invalid sender account!', 16, 1);
    RETURN;
  END   
  DECLARE @receiverBalanceBefore money = (SELECT Balance FROM Accounts WHERE Id = @receiverId);  
  IF(@receiverBalanceBefore IS NULL)
  BEGIN
    RAISERROR('Invalid receiver account!', 16, 1);
    RETURN;
  END   
  IF(@senderId = @receiverId)
  BEGIN
    RAISERROR('Sender and receiver accounts must be different!', 16, 1);
    RETURN;
  END  
  IF(@transferAmount <= 0)
  BEGIN
    RAISERROR ('Transfer amount must be positive!', 16, 1); 
    RETURN;
  END 
  
  BEGIN TRANSACTION
  EXEC usp_WithdrawMoney @senderId, @transferAmount;
  EXEC usp_DepositMoney @receiverId, @transferAmount;
  
  DECLARE @senderBalanceAfter money = (SELECT Balance FROM Accounts WHERE Id = @senderId);
  DECLARE @receiverBalanceAfter money = (SELECT Balance FROM Accounts WHERE Id = @receiverId);  
  IF((@senderBalanceAfter <> @senderBalanceBefore - @transferAmount) OR 
     (@receiverBalanceAfter <> @receiverBalanceBefore + @transferAmount))
    BEGIN
      ROLLBACK;
      RAISERROR('Invalid account balances!', 16, 1);
      RETURN;
    END
  COMMIT;
END