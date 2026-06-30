CREATE OR REPLACE FUNCTION CalculateAge(
    p_dob IN DATE
)
RETURN NUMBER
IS
    v_age NUMBER;
BEGIN
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, p_dob) / 12);

    RETURN v_age;
END;
/

--Execute
DECLARE
    v_age NUMBER;
BEGIN
    v_age := CalculateAge(TO_DATE('2004-05-15','YYYY-MM-DD'));

    DBMS_OUTPUT.PUT_LINE('Age = ' || v_age);
END;
/