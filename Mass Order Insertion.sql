DELIMITER $$

CREATE PROCEDURE Insert_Orders_Stress_Test()
BEGIN
    DECLARE i INT DEFAULT 1;
    START TRANSACTION;
    WHILE i <= 100000 DO
        INSERT INTO SDB_49SALE_ORDER (Order_ID, Cust_ID, Order_Date, Total_Amount)
        VALUES (i + 1000, (FLOOR(RAND() * 20) + 1), CURDATE(), (FLOOR(RAND() * 50000) + 5000));
        SET i = i + 1;
    END WHILE;
    COMMIT;
END$$

DELIMITER ;

CALL Insert_Orders_Stress_Test();
