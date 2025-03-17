-- Bulk UPDATE Stress Test --
DELIMITER $$

CREATE PROCEDURE Update_Stress_Test()
BEGIN
    DECLARE i INT DEFAULT 1;
    START TRANSACTION;
    WHILE i <= 100 DO  -- Updates 50,000 records
        UPDATE SDB_49CUSTOMER 
        SET Contact = CONCAT('updated_email', i, '@test.com') 
        WHERE Cust_ID = (FLOOR(RAND() * 100000) + 1000);
        SET i = i + 1;
    END WHILE;
    COMMIT;
END$$

DELIMITER ;

CALL Update_Stress_Test();
