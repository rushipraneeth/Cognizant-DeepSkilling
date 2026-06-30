-- Trigger
CREATE OR REPLACE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE
ON Customers
FOR EACH ROW
BEGIN
    :NEW.LastModified := SYSDATE;
END;
/


--Test
UPDATE Customers
SET Balance = 12000
WHERE CustomerID = 1;


--Verify
SELECT CustomerID,
       Name,
       Balance,
       LastModified
FROM Customers
WHERE CustomerID = 1;

