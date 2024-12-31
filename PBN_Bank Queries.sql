-- What is the total balance held by customers in each branch?

SELECT 
    bm.BranchName,
    SUM(ad.Balance) AS TotalBalance
FROM 
    AccountDetails ad
JOIN 
    CustomerDetails cd ON ad.CustomerID = cd.CustomerID
JOIN 
    BranchMaster bm ON cd.BID = bm.BID
GROUP BY 
    bm.BranchName
ORDER BY 
    TotalBalance DESC;



-- What is the total amount of credit and debit transactions by account type?

SELECT 
    pm.ProductName AS AccountType,
    t.TransactionType,
    SUM(t.Amount) AS TotalAmount
FROM 
    Transactions t
JOIN 
    AccountDetails ad ON t.AccountID = ad.AccountID
JOIN 
    ProductMaster pm ON ad.PID = pm.PID
GROUP BY 
    pm.ProductName, t.TransactionType
ORDER BY 
    pm.ProductName, t.TransactionType;


-- Which customer has made the highest number of transactions?

SELECT 
    cd.CustomerID,
    cd.CustomerName,
    COUNT(t.TransactionID) AS TotalTransactions
FROM 
    Transactions t
JOIN 
    AccountDetails ad ON t.AccountID = ad.AccountID
JOIN 
    CustomerDetails cd ON ad.CustomerID = cd.CustomerID
GROUP BY 
    cd.CustomerID, cd.CustomerName
ORDER BY 
    TotalTransactions DESC
LIMIT 1;


-- Which branches have the highest total transaction amounts?

SELECT 
    bm.BID,
    bm.BranchName,
    SUM(t.Amount) AS TotalTransactionAmount
FROM 
    Transactions t
JOIN 
    AccountDetails ad ON t.AccountID = ad.AccountID
JOIN 
    CustomerDetails cd ON ad.CustomerID = cd.CustomerID
JOIN 
    BranchMaster bm ON cd.BID = bm.BID
GROUP BY 
    bm.BID, bm.BranchName
ORDER BY 
    TotalTransactionAmount DESC;


-- Which branch has the highest customer balance across all accounts?

SELECT 
    bm.BID,
    bm.BranchName,
    SUM(ad.Balance) AS TotalCustomerBalance
FROM 
    AccountDetails ad
JOIN 
    CustomerDetails cd ON ad.CustomerID = cd.CustomerID
JOIN 
    BranchMaster bm ON cd.BID = bm.BID
GROUP BY 
    bm.BID, bm.BranchName
ORDER BY 
    TotalCustomerBalance DESC
LIMIT 1;


-- What is the average balance per customer in each branch?

SELECT 
    bm.BID,
    bm.BranchName,
    round(AVG(cd.TotalBalance),2) AS AverageBalancePerCustomer
FROM (
    SELECT 
        cd.CustomerID,
        cd.BID,
        SUM(ad.Balance) AS TotalBalance
    FROM 
        CustomerDetails cd
    JOIN 
        AccountDetails ad ON cd.CustomerID = ad.CustomerID
    GROUP BY 
        cd.CustomerID, cd.BID
) cd
JOIN 
    BranchMaster bm ON cd.BID = bm.BID
GROUP BY 
    bm.BID, bm.BranchName;


