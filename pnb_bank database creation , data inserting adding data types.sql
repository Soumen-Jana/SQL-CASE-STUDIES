/*****************************************************************************************
Name    : Code for PNB DB
Author  : Soumenjana

Purpose : This script will create the database and tables to store info about PNB.
*****************************************************************************************/

-- Create database
CREATE DATABASE PNB_BANK;

USE PNB_BANK;


-- Create table ProductMaster
CREATE TABLE ProductMaster (
    PID CHAR(2) PRIMARY KEY,
    ProductName VARCHAR(25) NOT NULL
);


-- Insert PNB-specific products
INSERT INTO ProductMaster VALUES ('CA', 'Current Account');
INSERT INTO ProductMaster VALUES ('OD', 'Overdraft');
INSERT INTO ProductMaster VALUES ('GL', 'Gold Loan');
INSERT INTO ProductMaster VALUES ('RD', 'Recurring Deposit');
INSERT INTO ProductMaster VALUES ('FD', 'Fixed Deposit');


-- Create table RegionMaster
CREATE TABLE RegionMaster (
    RID INT PRIMARY KEY,
    RegionName CHAR(10) NOT NULL
);


-- Insert PNB-specific regions
INSERT INTO RegionMaster VALUES (1, 'North');
INSERT INTO RegionMaster VALUES (2, 'East');
INSERT INTO RegionMaster VALUES (3, 'West');
INSERT INTO RegionMaster VALUES (4, 'South');
INSERT INTO RegionMaster VALUES (5, 'Central');


-- Create Table: BranchMaster
CREATE TABLE BranchMaster (
    BID INT PRIMARY KEY,
    BranchName VARCHAR(50) NOT NULL,
    RID INT NOT NULL,
    Address VARCHAR(100),
    FOREIGN KEY (RID) REFERENCES RegionMaster(RID)
);

-- Insert Data: BranchMaster
INSERT INTO BranchMaster VALUES (101, 'Delhi Main Branch', 1, 'Connaught Place, Delhi');
INSERT INTO BranchMaster VALUES (102, 'Kolkata Branch', 2, 'Park Street, Kolkata');
INSERT INTO BranchMaster VALUES (103, 'Mumbai Branch', 3, 'Fort Area, Mumbai');
INSERT INTO BranchMaster VALUES (104, 'Chennai Branch', 4, 'Mount Road, Chennai');
INSERT INTO BranchMaster VALUES (105, 'Bhopal Branch', 5, 'Arera Hills, Bhopal');
INSERT INTO BranchMaster VALUES (106, 'Jaipur Branch', 1, 'MI Road, Jaipur'); 
INSERT INTO BranchMaster VALUES (107, 'Lucknow Branch', 1, 'Hazratganj, Lucknow'); 
INSERT INTO BranchMaster VALUES (108, 'Guwahati Branch', 2, 'GS Road, Guwahati'); 
INSERT INTO BranchMaster VALUES (109, 'Bhubaneswar Branch', 2, 'Janpath, Bhubaneswar'); 
INSERT INTO BranchMaster VALUES (110, 'Pune Branch', 3, 'Shivajinagar, Pune'); 
INSERT INTO BranchMaster VALUES (111, 'Ahmedabad Branch', 3, 'Ashram Road, Ahmedabad'); 
INSERT INTO BranchMaster VALUES (112, 'Bengaluru Branch', 4, 'MG Road, Bengaluru'); 
INSERT INTO BranchMaster VALUES (113, 'Hyderabad Branch', 4, 'Banjara Hills, Hyderabad'); 
INSERT INTO BranchMaster VALUES (114, 'Indore Branch', 5, 'Palasia Square, Indore'); 
INSERT INTO BranchMaster VALUES (115, 'Raipur Branch', 5, 'Pandri Road, Raipur'); 
INSERT INTO BranchMaster VALUES (116, 'Amritsar Branch', 1, 'Golden Temple Road, Amritsar'); 
INSERT INTO BranchMaster VALUES (117, 'Dehradun Branch', 1, 'Rajpur Road, Dehradun'); 
INSERT INTO BranchMaster VALUES (118, 'Ranchi Branch', 2, 'Main Road, Ranchi'); 
INSERT INTO BranchMaster VALUES (119, 'Patna Branch', 2, 'Fraser Road, Patna'); 
INSERT INTO BranchMaster VALUES (120, 'Surat Branch', 3, 'Ring Road, Surat'); 
INSERT INTO BranchMaster VALUES (121, 'Vadodara Branch', 3, 'Alkapuri, Vadodara'); 
INSERT INTO BranchMaster VALUES (122, 'Coimbatore Branch', 4, 'Avinashi Road, Coimbatore'); 
INSERT INTO BranchMaster VALUES (123, 'Kochi Branch', 4, 'Marine Drive, Kochi'); 
INSERT INTO BranchMaster VALUES (124, 'Gwalior Branch', 5, 'Phool Bagh, Gwalior'); 
INSERT INTO BranchMaster VALUES (125, 'Nagpur Branch', 5, 'Sitabuldi, Nagpur'); 



-- Create Table: CustomerDetails
CREATE TABLE CustomerDetails (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(15),
    BID INT NOT NULL,
    FOREIGN KEY (BID) REFERENCES BranchMaster(BID)
);


-- Insert Data: CustomerDetails
INSERT INTO CustomerDetails VALUES (1, 'Rahul Sharma', '9876543210', 101);
INSERT INTO CustomerDetails VALUES (2, 'Sangeeta Gupta', '8765432109', 102);
INSERT INTO CustomerDetails VALUES (3, 'Amit Roy', '7654321098', 103);
INSERT INTO CustomerDetails VALUES (4, 'Priya Iyer', '6543210987', 104);
INSERT INTO CustomerDetails VALUES (5, 'Vivek Jain', '5432109876', 105);
INSERT INTO CustomerDetails VALUES (6, 'Manoj Kumar', '9123456789', 106); 
INSERT INTO CustomerDetails VALUES (7, 'Anjali Singh', '9988776655', 107); 
INSERT INTO CustomerDetails VALUES (8, 'Debashish Sen', '8877665544', 108); 
INSERT INTO CustomerDetails VALUES (9, 'Arundhati Bose', '7766554433', 109); 
INSERT INTO CustomerDetails VALUES (10, 'Nilesh Patil', '9988998899', 110); 
INSERT INTO CustomerDetails VALUES (11, 'Kavita Shah', '9111223344', 111); 
INSERT INTO CustomerDetails VALUES (12, 'Ramesh Babu', '8999887766', 112); 
INSERT INTO CustomerDetails VALUES (13, 'Padma Lakshmi', '7888776655', 113); 
INSERT INTO CustomerDetails VALUES (14, 'Anupam Tiwari', '9666778899', 114); 
INSERT INTO CustomerDetails VALUES (15, 'Sunita Verma', '8777665544', 115);
INSERT INTO CustomerDetails VALUES (16, 'Harpreet Kaur', '9123123456', 116); 
INSERT INTO CustomerDetails VALUES (17, 'Aniket Chauhan', '9001122334', 117); 
INSERT INTO CustomerDetails VALUES (18, 'Ravi Sinha', '9112233445', 118);
INSERT INTO CustomerDetails VALUES (19, 'Nikita Jha', '7886655443', 119); 
INSERT INTO CustomerDetails VALUES (20, 'Mehul Desai', '9445566778', 120); -- Surat Branch
INSERT INTO CustomerDetails VALUES (21, 'Vaishali Trivedi', '9887766554', 121); -- Vadodara Branch
INSERT INTO CustomerDetails VALUES (22, 'Vignesh Reddy', '8899776655', 122); -- Coimbatore Branch
INSERT INTO CustomerDetails VALUES (23, 'Priyanka Menon', '9009876543', 123); -- Kochi Branch
INSERT INTO CustomerDetails VALUES (24, 'Siddharth Sharma', '9111234567', 124); -- Gwalior Branch
INSERT INTO CustomerDetails VALUES (25, 'Neha Kulkarni', '9009988776', 125); -- Nagpur Branch


-- Create Table: AccountDetails
CREATE TABLE AccountDetails (
    AccountID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    PID CHAR(2) NOT NULL,
    Balance DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES CustomerDetails(CustomerID),
    FOREIGN KEY (PID) REFERENCES ProductMaster(PID)
);


-- Insert Data: AccountDetails
INSERT INTO AccountDetails VALUES (1001, 1, 'CA', 50000.00);
INSERT INTO AccountDetails VALUES (1002, 2, 'FD', 200000.00);
INSERT INTO AccountDetails VALUES (1003, 3, 'GL', 300000.00);
INSERT INTO AccountDetails VALUES (1004, 4, 'RD', 100000.00);
INSERT INTO AccountDetails VALUES (1005, 5, 'OD', 15000.00);
INSERT INTO AccountDetails VALUES (1006, 6, 'CA', 25000.00); -- Manoj Kumar
INSERT INTO AccountDetails VALUES (1007, 7, 'FD', 300000.00); -- Anjali Singh
INSERT INTO AccountDetails VALUES (1008, 8, 'GL', 150000.00); -- Debashish Sen
INSERT INTO AccountDetails VALUES (1009, 9, 'RD', 120000.00); -- Arundhati Bose
INSERT INTO AccountDetails VALUES (1010, 10, 'OD', 10000.00); -- Nilesh Patil
INSERT INTO AccountDetails VALUES (1011, 11, 'CA', 60000.00); -- Kavita Shah
INSERT INTO AccountDetails VALUES (1012, 12, 'FD', 250000.00); -- Ramesh Babu
INSERT INTO AccountDetails VALUES (1013, 13, 'GL', 450000.00); -- Padma Lakshmi
INSERT INTO AccountDetails VALUES (1014, 14, 'RD', 80000.00); -- Anupam Tiwari
INSERT INTO AccountDetails VALUES (1015, 15, 'OD', 20000.00); -- Sunita Verma
INSERT INTO AccountDetails VALUES (1016, 16, 'CA', 45000.00); -- Harpreet Kaur
INSERT INTO AccountDetails VALUES (1017, 17, 'FD', 500000.00); -- Aniket Chauhan
INSERT INTO AccountDetails VALUES (1018, 18, 'GL', 350000.00); -- Ravi Sinha
INSERT INTO AccountDetails VALUES (1019, 19, 'RD', 70000.00); -- Nikita Jha
INSERT INTO AccountDetails VALUES (1020, 20, 'OD', 25000.00); -- Mehul Desai
INSERT INTO AccountDetails VALUES (1021, 21, 'CA', 52000.00); -- Vaishali Trivedi
INSERT INTO AccountDetails VALUES (1022, 22, 'FD', 150000.00); -- Vignesh Reddy
INSERT INTO AccountDetails VALUES (1023, 23, 'GL', 400000.00); -- Priyanka Menon
INSERT INTO AccountDetails VALUES (1024, 24, 'RD', 90000.00); -- Siddharth Sharma
INSERT INTO AccountDetails VALUES (1025, 25, 'OD', 12000.00); -- Neha Kulkarni



-- Create Table: Transactions
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT NOT NULL,
    TransactionType VARCHAR(10) NOT NULL,
    Amount DECIMAL(10, 2),
    TransactionDate DATE NOT NULL,
    FOREIGN KEY (AccountID) REFERENCES AccountDetails(AccountID)
);


-- Insert Data: Transactions
INSERT INTO Transactions VALUES (1, 1001, 'Credit', 20000.00, '2024-12-01');
INSERT INTO Transactions VALUES (2, 1002, 'Debit', 5000.00, '2024-12-02');
INSERT INTO Transactions VALUES (3, 1003, 'Credit', 10000.00, '2024-12-03');
INSERT INTO Transactions VALUES (4, 1004, 'Debit', 2000.00, '2024-12-04');
INSERT INTO Transactions VALUES (5, 1005, 'Credit', 8000.00, '2024-12-05');
INSERT INTO Transactions VALUES (6, 1001, 'Debit', 10000.00, '2024-12-06'); -- Rahul Sharma
INSERT INTO Transactions VALUES (7, 1002, 'Credit', 15000.00, '2024-12-07'); -- Sangeeta Gupta
INSERT INTO Transactions VALUES (8, 1003, 'Debit', 5000.00, '2024-12-08'); -- Amit Roy
INSERT INTO Transactions VALUES (9, 1004, 'Credit', 7000.00, '2024-12-09'); -- Priya Iyer
INSERT INTO Transactions VALUES (10, 1005, 'Debit', 3000.00, '2024-12-10'); -- Vivek Jain
INSERT INTO Transactions VALUES (11, 1006, 'Credit', 15000.00, '2024-12-11'); -- Manoj Kumar
INSERT INTO Transactions VALUES (12, 1007, 'Debit', 20000.00, '2024-12-12'); -- Anjali Singh
INSERT INTO Transactions VALUES (13, 1008, 'Credit', 30000.00, '2024-12-13'); -- Debashish Sen
INSERT INTO Transactions VALUES (14, 1009, 'Debit', 10000.00, '2024-12-14'); -- Arundhati Bose
INSERT INTO Transactions VALUES (15, 1010, 'Credit', 5000.00, '2024-12-15'); -- Nilesh Patil
INSERT INTO Transactions VALUES (16, 1011, 'Debit', 8000.00, '2024-12-16'); -- Kavita Shah
INSERT INTO Transactions VALUES (17, 1012, 'Credit', 10000.00, '2024-12-17'); -- Ramesh Babu
INSERT INTO Transactions VALUES (18, 1013, 'Debit', 15000.00, '2024-12-18'); -- Padma Lakshmi
INSERT INTO Transactions VALUES (19, 1014, 'Credit', 20000.00, '2024-12-19'); -- Anupam Tiwari
INSERT INTO Transactions VALUES (20, 1015, 'Debit', 5000.00, '2024-12-20'); -- Sunita Verma
INSERT INTO Transactions VALUES (21, 1016, 'Credit', 30000.00, '2024-12-21'); -- Harpreet Kaur
INSERT INTO Transactions VALUES (22, 1017, 'Debit', 10000.00, '2024-12-22'); -- Aniket Chauhan
INSERT INTO Transactions VALUES (23, 1018, 'Credit', 40000.00, '2024-12-23'); -- Ravi Sinha
INSERT INTO Transactions VALUES (24, 1019, 'Debit', 2000.00, '2024-12-24'); -- Nikita Jha
INSERT INTO Transactions VALUES (25, 1020, 'Credit', 10000.00, '2024-12-25'); -- Mehul Desai
INSERT INTO Transactions VALUES (26, 1021, 'Debit', 12000.00, '2024-12-26'); -- Vaishali Trivedi
INSERT INTO Transactions VALUES (27, 1022, 'Credit', 18000.00, '2024-12-27'); -- Vignesh Reddy
INSERT INTO Transactions VALUES (28, 1023, 'Debit', 22000.00, '2024-12-28'); -- Priyanka Menon
INSERT INTO Transactions VALUES (29, 1024, 'Credit', 25000.00, '2024-12-29'); -- Siddharth Sharma
INSERT INTO Transactions VALUES (30, 1025, 'Debit', 1000.00, '2024-12-30'); -- Neha Kulkarni







