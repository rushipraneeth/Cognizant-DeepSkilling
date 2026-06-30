CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment(
    p_loanAmount IN NUMBER,
    p_interestRate IN NUMBER,
    p_years IN NUMBER
)
RETURN NUMBER
IS
    v_interest NUMBER;
    v_total NUMBER;
    v_monthly NUMBER;
BEGIN

    v_interest := (p_loanAmount * p_interestRate * p_years) / 100;

    v_total := p_loanAmount + v_interest;

    v_monthly := v_total / (p_years * 12);

    RETURN ROUND(v_monthly,2);

END;
/


--Execute
DECLARE
    v_installment NUMBER;
BEGIN
    v_installment := CalculateMonthlyInstallment(
                        500000,
                        8,
                        5
                     );

    DBMS_OUTPUT.PUT_LINE(
        'Monthly Installment = ' || v_installment
    );
END;
/