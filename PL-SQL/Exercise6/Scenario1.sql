DECLARE

    CURSOR GenerateMonthlyStatements IS
        SELECT c.CustomerID,
               c.Name,
               t.TransactionID,
               t.TransactionDate,
               t.Amount,
               t.TransactionType
        FROM Customers c
        JOIN Accounts a
            ON c.CustomerID = a.CustomerID
        JOIN Transactions t
            ON a.AccountID = t.AccountID
        WHERE EXTRACT(MONTH FROM t.TransactionDate) = EXTRACT(MONTH FROM SYSDATE)
          AND EXTRACT(YEAR FROM t.TransactionDate) = EXTRACT(YEAR FROM SYSDATE);

    v_record GenerateMonthlyStatements%ROWTYPE;

BEGIN

    OPEN GenerateMonthlyStatements;

    LOOP

        FETCH GenerateMonthlyStatements
        INTO v_record;

        EXIT WHEN GenerateMonthlyStatements%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Customer ID : ' || v_record.CustomerID
        );

        DBMS_OUTPUT.PUT_LINE(
            'Customer Name : ' || v_record.Name
        );

        DBMS_OUTPUT.PUT_LINE(
            'Transaction ID : ' || v_record.TransactionID
        );

        DBMS_OUTPUT.PUT_LINE(
            'Transaction Date : ' || v_record.TransactionDate
        );

        DBMS_OUTPUT.PUT_LINE(
            'Amount : ' || v_record.Amount
        );

        DBMS_OUTPUT.PUT_LINE(
            'Type : ' || v_record.TransactionType
        );

        DBMS_OUTPUT.PUT_LINE('-------------------------');

    END LOOP;

    CLOSE GenerateMonthlyStatements;

END;
/