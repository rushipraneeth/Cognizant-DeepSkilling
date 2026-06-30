CREATE OR REPLACE PROCEDURE SafeTransferFunds(
    p_fromAccount IN NUMBER,
    p_toAccount   IN NUMBER,
    p_amount      IN NUMBER
)
IS
    v_balance NUMBER;
BEGIN
    -- Get source account balance
    SELECT Balance
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_fromAccount;

    -- Check balance
    IF v_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20001,
        'Insufficient Funds');
    END IF;

    -- Debit source account
    UPDATE Accounts
    SET Balance = Balance - p_amount
    WHERE AccountID = p_fromAccount;

    -- Credit destination account
    UPDATE Accounts
    SET Balance = Balance + p_amount
    WHERE AccountID = p_toAccount;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Transfer Successful');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Transfer Failed : ' || SQLERRM);
END;
/




-- Execution

BEGIN
    SafeTransferFunds(1,2,500);
END;
/