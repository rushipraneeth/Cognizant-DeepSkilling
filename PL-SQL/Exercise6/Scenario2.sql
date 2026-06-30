DECLARE

    CURSOR ApplyAnnualFee IS
        SELECT AccountID
        FROM Accounts;

    v_account ApplyAnnualFee%ROWTYPE;

    v_fee NUMBER := 500;

BEGIN

    OPEN ApplyAnnualFee;

    LOOP

        FETCH ApplyAnnualFee
        INTO v_account;

        EXIT WHEN ApplyAnnualFee%NOTFOUND;

        UPDATE Accounts
        SET Balance = Balance - v_fee
        WHERE AccountID = v_account.AccountID;

        DBMS_OUTPUT.PUT_LINE(
            'Annual fee deducted from Account ID : '
            || v_account.AccountID
        );

    END LOOP;

    CLOSE ApplyAnnualFee;

    COMMIT;

END;
/