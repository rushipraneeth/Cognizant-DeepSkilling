--Package Specification
CREATE OR REPLACE PACKAGE CustomerManagement AS

    PROCEDURE AddCustomer(
        p_id NUMBER,
        p_name VARCHAR2,
        p_dob DATE,
        p_balance NUMBER
    );

    PROCEDURE UpdateCustomer(
        p_id NUMBER,
        p_name VARCHAR2,
        p_balance NUMBER
    );

    FUNCTION GetCustomerBalance(
        p_id NUMBER
    ) RETURN NUMBER;

END CustomerManagement;
/



--Package Body
CREATE OR REPLACE PACKAGE BODY CustomerManagement AS

    PROCEDURE AddCustomer(
        p_id NUMBER,
        p_name VARCHAR2,
        p_dob DATE,
        p_balance NUMBER
    )
    IS
    BEGIN
        INSERT INTO Customers
        VALUES(
            p_id,
            p_name,
            p_dob,
            p_balance,
            SYSDATE
        );
    END AddCustomer;

    PROCEDURE UpdateCustomer(
        p_id NUMBER,
        p_name VARCHAR2,
        p_balance NUMBER
    )
    IS
    BEGIN
        UPDATE Customers
        SET Name = p_name,
            Balance = p_balance
        WHERE CustomerID = p_id;
    END UpdateCustomer;

    FUNCTION GetCustomerBalance(
        p_id NUMBER
    )
    RETURN NUMBER
    IS
        v_balance NUMBER;
    BEGIN
        SELECT Balance
        INTO v_balance
        FROM Customers
        WHERE CustomerID = p_id;

        RETURN v_balance;
    END GetCustomerBalance;

END CustomerManagement;
/

--Execution
--Add Customer
BEGIN
    CustomerManagement.AddCustomer(
        5,
        'Rushi',
        TO_DATE('2004-05-15','YYYY-MM-DD'),
        15000
    );
END;
/

--Update Customer
BEGIN
    CustomerManagement.UpdateCustomer(
        5,
        'Rushi Praneeth',
        18000
    );
END;
/

--Get Balance
DECLARE
    v_balance NUMBER;
BEGIN
    v_balance := CustomerManagement.GetCustomerBalance(5);

    DBMS_OUTPUT.PUT_LINE('Balance = '||v_balance);
END;
/