DELIMITER $$

CREATE PROCEDURE Query_Stress_Test()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10000 DO
        SELECT c.Cust_Name, o.Order_ID, o.Order_Date, o.Total_Amount
        FROM SDB_49CUSTOMER c
        JOIN SDB_49SALE_ORDER o ON c.Cust_ID = o.Cust_ID
        WHERE o.Total_Amount > 20000
        ORDER BY o.Order_Date DESC
        LIMIT 10;
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

CALL Query_Stress_Test();
