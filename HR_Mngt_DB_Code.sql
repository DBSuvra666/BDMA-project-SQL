-- Drop the database if it already exists
DROP DATABASE IF EXISTS SDB_49company_database;

-- Create the database
CREATE DATABASE IF NOT EXISTS SDB_49company_database;
USE SDB_49company_database;

-- Create CUSTOMER table
CREATE TABLE SDB_49CUSTOMER (
    Cust_ID INT PRIMARY KEY,
    Cust_Name VARCHAR(255),
    Contact VARCHAR(255),
    Address VARCHAR(255)
);

-- Create SUPPLIER table
CREATE TABLE SDB_49SUPPLIER (
    Supp_ID INT PRIMARY KEY,
    Supp_Name VARCHAR(255),
    Contact VARCHAR(255),
    Address VARCHAR(255)
);

-- Create PRODUCT table
CREATE TABLE SDB_49PRODUCT (
    Prod_ID INT PRIMARY KEY,
    Prod_Name VARCHAR(255),
    Supp_ID INT,
    Price DECIMAL(10, 2),
    Description TEXT,
    FOREIGN KEY (Supp_ID) REFERENCES SDB_49SUPPLIER(Supp_ID)
);

-- Create SALE_ORDER table
CREATE TABLE SDB_49SALE_ORDER (
    Order_ID INT PRIMARY KEY,
    Cust_ID INT,
    Order_Date DATE,
    Total_Amount DECIMAL(10, 2),
    FOREIGN KEY (Cust_ID) REFERENCES SDB_49CUSTOMER(Cust_ID)
);

-- Create ORDER_ITEM table
CREATE TABLE SDB_49ORDER_ITEM (
    Item_ID INT PRIMARY KEY,
    Order_ID INT,
    Prod_ID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (Order_ID) REFERENCES SDB_49SALE_ORDER(Order_ID),
    FOREIGN KEY (Prod_ID) REFERENCES SDB_49PRODUCT(Prod_ID)
);

-- Create DEPARTMENT table
CREATE TABLE SDB_49DEPARTMENT (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(255)
);

-- Create EMPLOYEE table
CREATE TABLE SDB_49EMPLOYEE (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(255) NOT NULL,
    Dept_ID INT,
    Mgr_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES SDB_49DEPARTMENT(Dept_ID),
    FOREIGN KEY (Mgr_ID) REFERENCES SDB_49EMPLOYEE(Emp_ID)
);

-- Create PROJECT table
CREATE TABLE SDB_49PROJECT (
    Proj_ID INT PRIMARY KEY,
    Proj_Name VARCHAR(255),
    Start_Date DATE,
    End_Date DATE,
    Budget DECIMAL(15, 2)
);

-- Create PROJECT_MILESTONE table
CREATE TABLE SDB_49PROJECT_MILESTONE (
    Milestone_ID INT PRIMARY KEY,
    Proj_ID INT,
    Milestone_Name VARCHAR(255),
    Due_Date DATE,
    Status VARCHAR(255),
    FOREIGN KEY (Proj_ID) REFERENCES SDB_49PROJECT(Proj_ID)
);

-- Create PROJECT_ASSIGNMENT table
CREATE TABLE SDB_49PROJECT_ASSIGNMENT (
    Assignment_ID INT PRIMARY KEY,
    Emp_ID INT,
    Proj_ID INT,
    Start_Date DATE,
    End_Date DATE,
    Role VARCHAR(255),
    FOREIGN KEY (Emp_ID) REFERENCES SDB_49EMPLOYEE(Emp_ID),
    FOREIGN KEY (Proj_ID) REFERENCES SDB_49PROJECT(Proj_ID)
);

-- Create PERFORMANCE_REVIEW table
CREATE TABLE SDB_49PERFORMANCE_REVIEW (
    Review_ID INT PRIMARY KEY,
    Emp_ID INT,
    Review_Date DATE,
    Rating INT,
    Comments TEXT,
    FOREIGN KEY (Emp_ID) REFERENCES SDB_49EMPLOYEE(Emp_ID)
);

-- Create ATTENDANCE table
CREATE TABLE SDB_49ATTENDANCE (
    Attendance_ID INT PRIMARY KEY,
    Emp_ID INT,
    Date DATE,
    Status VARCHAR(255),
    FOREIGN KEY (Emp_ID) REFERENCES SDB_49EMPLOYEE(Emp_ID)
);



use SDB_49company_database;

-- Insert records into SDB_49CUSTOMER
INSERT  INTO SDB_49CUSTOMER (Cust_ID, Cust_Name, Contact, Address) VALUES
(1, 'Arjun Sharma', 'arjun.sharma@email.com', 'Delhi, India'),
(2, 'Priya Singh', 'priya.singh@email.com', 'Mumbai, India'),
(3, 'Rahul Verma', 'rahul.verma@email.com', 'Lucknow, India'),
(4, 'Sneha Patel', 'sneha.patel@email.com', 'Ahmedabad, India'),
(5, 'Rohan Gupta', 'rohan.gupta@email.com', 'Kolkata, India'),
(6, 'Amit Kumar', 'amit.kumar@email.com', 'Chennai, India'),
(7, 'Anjali Nair', 'anjali.nair@email.com', 'Bengaluru, India'),
(8, 'Kunal Deshmukh', 'kunal.deshmukh@email.com', 'Pune, India'),
(9, 'Neha Chawla', 'neha.chawla@email.com', 'Chandigarh, India'),
(10, 'Vikram Joshi', 'vikram.joshi@email.com', 'Hyderabad, India'),
(11, 'Pooja Mehta', 'pooja.mehta@email.com', 'Jaipur, India'),
(12, 'Rajesh Iyer', 'rajesh.iyer@email.com', 'Kochi, India'),
(13, 'Meera Kapoor', 'meera.kapoor@email.com', 'Nagpur, India'),
(14, 'Siddharth Chauhan', 'siddharth.chauhan@email.com', 'Indore, India'),
(15, 'Alok Mishra', 'alok.mishra@email.com', 'Patna, India'),
(16, 'Swati Rajan', 'swati.rajan@email.com', 'Bhubaneswar, India'),
(17, 'Aditya Malhotra', 'aditya.malhotra@email.com', 'Gurgaon, India'),
(18, 'Divya Arora', 'divya.arora@email.com', 'Noida, India'),
(19, 'Nikhil Tiwari', 'nikhil.tiwari@email.com', 'Varanasi, India'),
(20, 'Simran Kaur', 'simran.kaur@email.com', 'Amritsar, India');

-- Insert records into SDB_49SUPPLIER
INSERT INTO SDB_49SUPPLIER (Supp_ID, Supp_Name, Contact, Address) VALUES
(1, 'TechSource Pvt. Ltd.', 'support@techsource.com', 'Bengaluru, India'),
(2, 'Mobile Solutions India', 'info@mobilesolutions.in', 'Mumbai, India'),
(3, 'AudioHub Enterprises', 'sales@audiohub.com', 'Delhi, India'),
(4, 'HomeAppliances World', 'service@homeappliancesworld.com', 'Chennai, India'),
(5, 'Cooling Systems Ltd.', 'info@coolingsystems.com', 'Hyderabad, India'),
(6, 'Vision Electronics', 'support@visionelectronics.com', 'Ahmedabad, India'),
(7, 'KitchenTech Solutions', 'contact@kitchentech.in', 'Pune, India'),
(8, 'Comfort Air Pvt. Ltd.', 'sales@comfortair.com', 'Kolkata, India'),
(9, 'Wearable World', 'info@wearableworld.com', 'Delhi, India'),
(10, 'Smart Home India', 'support@smarthome.in', 'Lucknow, India');

-- Insert records into SDB_49PRODUCT
INSERT INTO SDB_49PRODUCT (Prod_ID, Prod_Name, Supp_ID, Price, Description) VALUES
(1, 'Laptop - Dell Inspiron', 1, 55000.00, '15.6 inch, Intel Core i5, 8GB RAM, 512GB SSD'),
(2, 'Smartphone - Samsung Galaxy', 2, 20000.00, '6.4 inch, 128GB storage, 5000mAh battery'),
(3, 'Headphones - Boat Rockerz', 3, 2000.00, 'Wireless headphones with deep bass'),
(4, 'Tablet - Lenovo Tab', 1, 15000.00, '10.1 inch, 4GB RAM, 64GB storage'),
(5, 'Washing Machine - LG', 4, 30000.00, 'Front-load, 6kg capacity'),
(6, 'Refrigerator - Whirlpool', 5, 45000.00, 'Double-door, 300L capacity'),
(7, 'Television - Sony Bravia', 6, 60000.00, '55 inch, 4K UHD Smart TV'),
(8, 'Microwave Oven - IFB', 7, 12000.00, 'Convection, 25L capacity'),
(9, 'Air Conditioner - Voltas', 8, 35000.00, '1.5 Ton Split AC'),
(10, 'Smartwatch - Apple Watch', 9, 40000.00, 'GPS + Cellular, 44mm'),
(11, 'Bluetooth Speaker - JBL', 3, 5000.00, 'Portable wireless speaker'),
(12, 'Electric Kettle - Philips', 10, 2500.00, '1.5L capacity, auto shut-off'),
(13, 'Digital Camera - Canon', 6, 45000.00, '24.1MP DSLR with lens kit'),
(14, 'Home Theater System - Sony', 5, 35000.00, '5.1 channel surround sound'),
(15, 'Router - TP-Link', 2, 2000.00, 'Dual-band Wi-Fi router'),
(16, 'Gaming Console - Xbox', 7, 45000.00, '1TB storage, wireless controller'),
(17, 'Kitchen Chimney - Faber', 4, 18000.00, 'Wall-mounted, 1100m3/hr suction'),
(18, 'Fitness Band - Mi Band', 3, 2500.00, 'Heart rate monitor, step tracker'),
(19, 'Water Purifier - Kent', 5, 15000.00, 'RO+UV purification'),
(20, 'Vacuum Cleaner - Dyson', 9, 40000.00, 'Cordless, high suction power');

-- Insert records into SDB_49SALE_ORDER
INSERT INTO SDB_49SALE_ORDER (Order_ID, Cust_ID, Order_Date, Total_Amount) VALUES
(1, 1, '2024-12-15', 55000.00),
(2, 2, '2024-12-16', 20000.00),
(3, 3, '2024-12-17', 2000.00),
(4, 4, '2024-12-18', 15000.00),
(5, 5, '2024-12-19', 30000.00),
(6, 6, '2024-12-20', 45000.00),
(7, 7, '2024-12-21', 60000.00),
(8, 8, '2024-12-22', 12000.00),
(9, 9, '2024-12-23', 35000.00),
(10, 10, '2024-12-24', 40000.00),
(11, 11, '2024-12-25', 5000.00),
(12, 12, '2024-12-26', 2500.00),
(13, 13, '2024-12-27', 45000.00),
(14, 14, '2024-12-28', 35000.00),
(15, 15, '2024-12-29', 2000.00),
(16, 16, '2024-12-30', 45000.00),
(17, 17, '2024-12-31', 18000.00),
(18, 18, '2025-01-01', 2500.00),
(19, 19, '2025-01-02', 15000.00),
(20, 20, '2025-01-03', 40000.00);

-- Insert records into SDB_49ORDER_ITEM
INSERT INTO SDB_49ORDER_ITEM (Item_ID, Order_ID, Prod_ID, Quantity, Price) VALUES
(1, 1, 1, 1, 55000.00),
(2, 2, 2, 1, 20000.00),
(3, 3, 3, 2, 2000.00),
(4, 4, 4, 1, 15000.00),
(5, 5, 5, 1, 30000.00),
(6, 6, 6, 1, 45000.00),
(7, 7, 7, 1, 60000.00),
(8, 8, 8, 2, 12000.00),
(9, 9, 9, 1, 35000.00),
(10, 10, 10, 1, 40000.00),
(11, 11, 11, 1, 5000.00),
(12, 12, 12, 1, 2500.00),
(13, 13, 13, 1, 45000.00),
(14, 14, 14, 1, 35000.00),
(15, 15, 15, 2, 2000.00),
(16, 16, 16, 1, 45000.00),
(17, 17, 17, 1, 18000.00),
(18, 18, 18, 2, 2500.00),
(19, 19, 19, 1, 15000.00),
(20, 20, 20, 1, 40000.00);

-- Insert records into SDB_49DEPARTMENT
INSERT INTO SDB_49DEPARTMENT (Dept_ID, Dept_Name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Marketing'),
(4, 'Sales'),
(5, 'Information Technology'),
(6, 'Operations');
-- Insert records into SDB_49EMPLOYEE
INSERT INTO SDB_49EMPLOYEE (Emp_ID, Emp_Name, Dept_ID, Mgr_ID) VALUES
(1, 'Rajesh Gupta', 5, NULL),    -- Manager of IT department
(2, 'Vikram Khanna', 4, NULL),       -- Reports to Sales manager
(3, 'Pooja Sharma', 3, NULL),        -- Reports to Sales manager
(4,   'Amit Verma', 4, NULL);   -- Manager of Sales department

-- Insert records into SDB_49PROJECT
INSERT INTO SDB_49PROJECT (Proj_ID, Proj_Name, Start_Date, End_Date, Budget) VALUES
(1, 'ERP Implementation', '2024-01-10', '2024-06-30', 5000000.00),
(2, 'Marketing Campaign Q1', '2024-02-01', '2024-03-31', 1200000.00),
(3, 'Product Launch', '2024-03-01', '2024-07-15', 3000000.00),
(4, 'Mobile App Development', '2024-04-01', '2024-12-01', 800000.00),
(5, 'Customer Support Upgrade', '2024-05-15', '2024-09-15', 1500000.00),
(6, 'Data Center Migration', '2024-07-01', '2024-12-15', 6000000.00);

-- Insert records into SDB_49PROJECT_MILESTONE
INSERT INTO SDB_49PROJECT_MILESTONE (Milestone_ID, Proj_ID, Milestone_Name, Due_Date, Status) VALUES
(1, 1, 'Requirements Gathering Complete', '2024-02-15', 'Completed'),
(2, 1, 'System Design Approved', '2024-03-10', 'Completed'),
(3, 1, 'Development Phase Complete', '2024-05-20', 'In Progress'),
(4, 2, 'Campaign Strategy Approved', '2024-02-20', 'Completed'),
(5, 2, 'Content Creation Complete', '2024-03-05', 'Completed'),
(6, 3, 'Prototype Ready', '2024-04-15', 'In Progress'),
(7, 3, 'Product Testing Begins', '2024-06-01', 'Pending'),
(8, 4, 'App Design Finalized', '2024-05-01', 'Completed'),
(9, 5, 'Customer Feedback Analysis', '2024-06-10', 'In Progress'),
(10, 6, 'Data Backup Completed', '2024-08-01', 'Pending');

-- Insert records into SDB_49PROJECT_ASSIGNMENT
INSERT INTO SDB_49PROJECT_ASSIGNMENT (Assignment_ID, Emp_ID, Proj_ID, Start_Date, End_Date, Role) VALUES
(1, 1, 1, '2024-01-10', '2024-06-30', 'Project Manager'),
(2, 2, 2, '2024-02-01', '2024-03-31', 'Marketing Specialist'),
(3, 3, 3, '2024-03-01', '2024-07-15', 'Sales Lead'),
(4, 4, 4, '2024-04-01', '2024-12-01', 'Mobile Developer'),
(5, 3, 5, '2024-05-15', '2024-09-15', 'Customer Support Analyst'),
(6, 1, 6, '2024-07-01', '2024-12-15', 'Infrastructure Manager'),
(7, 2, 1, '2024-01-15', '2024-06-15', 'IT Analyst'),
(8, 4, 3, '2024-03-01', '2024-07-15', 'Quality Assurance Lead');

-- Insert records into SDB_49PERFORMANCE_REVIEW
INSERT INTO SDB_49PERFORMANCE_REVIEW (Review_ID, Emp_ID, Review_Date, Rating, Comments) VALUES
(1, 1, '2024-12-15', 5, 'Excellent leadership and project management.'),
(2, 2, '2024-12-16', 4, 'Good performance in marketing campaigns.'),
(3, 3, '2024-12-17', 3, 'Average performance; needs improvement in meeting targets.'),
(4, 4, '2024-12-18', 5, 'Outstanding contributions to mobile app development.'),
(5, 1, '2024-06-30', 5, 'Efficient handling of ERP project deliverables.'),
(6, 2, '2024-03-31', 4, 'Successfully executed marketing strategies.'),
(7, 3, '2024-07-15', 3, 'Struggles with deadlines, but good team collaboration.'),
(8, 4, '2024-12-01', 5, 'Exceptional quality control and testing insights.'),
(9, 1, '2024-09-15', 5, 'Excellent performance in managing cross-functional teams.'),
(10, 2, '2024-05-31', 4, 'Effective team collaboration in campaign execution.');

-- Insert records into SDB_49ATTENDANCE
INSERT INTO SDB_49ATTENDANCE (Attendance_ID, Emp_ID, Date, Status) VALUES
(1, 1, '2024-12-01', 'Present'),
(2, 2, '2024-12-01', 'Present'),
(3, 3, '2024-12-01', 'Present'),
(4, 4, '2024-12-01', 'Absent'),
(5, 1, '2024-12-02', 'Present'),
(6, 2, '2024-12-02', 'Present'),
(7, 3, '2024-12-02', 'Present'),
(8, 4, '2024-12-02', 'Present'),
(9, 1, '2024-12-03', 'Present'),
(10, 2, '2024-12-03', 'Absent'),
(11, 3, '2024-12-03', 'Present'),
(12, 4, '2024-12-03', 'Present'),
(13, 1, '2024-12-04', 'Present'),
(14, 2, '2024-12-04', 'Present'),
(15, 3, '2024-12-04', 'Absent'),
(16, 4, '2024-12-04', 'Present'),
(17, 1, '2024-12-05', 'Present'),
(18, 2, '2024-12-05', 'Present'),
(19, 3, '2024-12-05', 'Present'),
(20, 4, '2024-12-05', 'Present');
