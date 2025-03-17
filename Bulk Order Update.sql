DELIMITER $$

CREATE PROCEDURE Update_Orders_Stress_Test()
BEGIN
    DECLARE i INT DEFAULT 1;
    START TRANSACTION;
    WHILE i <= 1000 DO
        UPDATE SDB_49SALE_ORDER 
        SET Total_Amount = (FLOOR(RAND() * 45000) + 5000) 
        WHERE Order_ID = (FLOOR(RAND() * 100000) + 1000);
        SET i = i + 1;
    END WHILE;
    COMMIT;
END$$

DELIMITER ;

CALL Update_Orders_Stress_Test();
