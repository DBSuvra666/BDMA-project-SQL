-- Scenario 1: INSERT a New Customer --
INSERT INTO SDB_49CUSTOMER (Cust_ID, Cust_Name, Contact, Address)
VALUES (21, 'Deepak Sharma', 'deepak.sharma@email.com', 'Bhopal, India');

-- Scenario 2: UPDATE Customer Details --
UPDATE SDB_49CUSTOMER 
SET Contact = 'arjun.newemail@email.com' 
WHERE Cust_ID = 1;


-- Scenario 4: INSERT a New Supplier --
INSERT INTO SDB_49SUPPLIER (Supp_ID, Supp_Name, Contact, Address)
VALUES (11, 'Green Energy Appliances', 'contact@greenenergy.com', 'Goa, India');

-- Scenario 5: UPDATE Supplier Contact Information --
UPDATE SDB_49SUPPLIER 
SET Contact = 'support@visionnew.com' 
WHERE Supp_ID = 6;



-- Scenario 7: INSERT a New Product --
INSERT INTO SDB_49PRODUCT (Prod_ID, Prod_Name, Supp_ID, Price, Description)
VALUES (21, 'Television - Sony Bravia 65 inch', 6, 75000.00, '65 inch, 4K UHD Smart TV');

-- Scenario 8: UPDATE Product Price --
UPDATE SDB_49PRODUCT 
SET Price = 58000.00 
WHERE Prod_ID = 1;



-- Scenario 10: INSERT a New Order --
INSERT INTO SDB_49SALE_ORDER (Order_ID, Cust_ID, Order_Date, Total_Amount)
VALUES (21, 21, '2025-01-04', 55000.00);

-- Scenario 11: UPDATE Order Amount --
UPDATE SDB_49SALE_ORDER 
SET Total_Amount = 50000.00 
WHERE Order_ID = 1;



-- Scenario 13: INSERT a New Employee --
INSERT INTO SDB_49EMPLOYEE (Emp_ID, Emp_Name, Dept_ID, Mgr_ID)
VALUES (5, 'Neha Bansal', 2, 1);

-- Scenario 14: UPDATE Employee Department --
UPDATE SDB_49EMPLOYEE 
SET Dept_ID = 5 
WHERE Emp_ID = 3;



-- Scenario 16: INSERT a New Project --
INSERT INTO SDB_49PROJECT (Proj_ID, Proj_Name, Start_Date, End_Date, Budget)
VALUES (7, 'AI Research Project', '2025-02-01', '2025-12-31', 10000000.00);

-- Scenario 17: UPDATE Project Budget --
UPDATE SDB_49PROJECT 
SET Budget = 5500000.00 
WHERE Proj_ID = 1;



-- Scenario 19: INSERT Employee Attendance --
INSERT INTO SDB_49ATTENDANCE (Attendance_ID, Emp_ID, Date, Status)
VALUES (21, 5, '2025-01-05', 'Present');

-- Scenario 20: UPDATE Attendance Status --
UPDATE SDB_49ATTENDANCE 
SET Status = 'Present' 
WHERE Emp_ID = 1 AND Date = '2024-12-02';

-- Scenario 21: DELETE Attendance Entry --
DELETE FROM SDB_49ATTENDANCE 
WHERE Attendance_ID = 10;
