-- 1. Bulk INSERT Stress Test --
DELIMITER $$

CREATE PROCEDURE Insert_Stress_Test()
BEGIN
    DECLARE i INT DEFAULT 1;
    START TRANSACTION;
    WHILE i <= 100000 DO  -- Inserts 100,000 records
        INSERT INTO SDB_49CUSTOMER (Cust_ID, Cust_Name, Contact, Address)
        VALUES (i + 1000, CONCAT('Customer_', i), CONCAT('customer', i, '@email.com'), CONCAT('City_', i));
        SET i = i + 1;
    END WHILE;
    COMMIT;
END$$

DELIMITER ;

CALL Insert_Stress_Test();
