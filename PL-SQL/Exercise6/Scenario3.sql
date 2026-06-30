DECLARE

    CURSOR UpdateLoanInterestRates IS
        SELECT LoanID,
               InterestRate
        FROM Loans;

    v_loan UpdateLoanInterestRates%ROWTYPE;

BEGIN

    OPEN UpdateLoanInterestRates;

    LOOP

        FETCH UpdateLoanInterestRates
        INTO v_loan;

        EXIT WHEN UpdateLoanInterestRates%NOTFOUND;

        IF v_loan.InterestRate < 5 THEN

            UPDATE Loans
            SET InterestRate = InterestRate + 0.5
            WHERE LoanID = v_loan.LoanID;

        ELSE

            UPDATE Loans
            SET InterestRate = InterestRate + 1
            WHERE LoanID = v_loan.LoanID;

        END IF;

        DBMS_OUTPUT.PUT_LINE(
            'Interest updated for Loan ID : '
            || v_loan.LoanID
        );

    END LOOP;

    CLOSE UpdateLoanInterestRates;

    COMMIT;

END;
/