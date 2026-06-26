-- ============================================================
-- Customer Churn Prediction & Retention Analytics
-- Database Creation and Exploratory SQL Analysis
-- ============================================================

-- Create a new database for the telecom customer churn project
CREATE DATABASE telecom_churn_db;

-- Select the database for further operations
USE telecom_churn_db;

-- ============================================================
-- Create Table
-- Stores customer demographic, service, billing,
-- contract, and churn-related information
-- ============================================================

CREATE TABLE telco_churn (
    CustomerID VARCHAR(50),
    Count INT,
    Country VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(100),
    Zip_Code INT,
    Lat_Long VARCHAR(100),
    Latitude DECIMAL(10,6),
    Longitude DECIMAL(10,6),
    Gender VARCHAR(20),
    Senior_Citizen VARCHAR(10),
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    Tenure_Months INT,
    Phone_Service VARCHAR(20),
    Multiple_Lines VARCHAR(50),
    Internet_Service VARCHAR(50),
    Online_Security VARCHAR(50),
    Online_Backup VARCHAR(50),
    Device_Protection VARCHAR(50),
    Tech_Support VARCHAR(50),
    Streaming_TV VARCHAR(50),
    Streaming_Movies VARCHAR(50),
    Contract VARCHAR(50),
    Paperless_Billing VARCHAR(10),
    Payment_Method VARCHAR(100),
    Monthly_Charges DECIMAL(10,2),
    Total_Charges DECIMAL(10,2),
    Churn_Label VARCHAR(10),
    Churn_Value INT,
    Churn_Score INT,
    CLTV INT,
    Churn_Reason VARCHAR(255)
);

-- ============================================================
-- Basic Data Validation
-- ============================================================

-- Display all records
SELECT * FROM telco_churn;

-- Count the total number of customer records
SELECT COUNT(*) FROM telco_churn;

-- Preview the first 10 records
SELECT * FROM telco_churn LIMIT 10;

-- ============================================================
-- KPI Analysis
-- Calculate Total Customers, Churned Customers,
-- and Overall Churn Rate
-- ============================================================

SELECT
    COUNT(*) AS total_customers,
    SUM(Churn_Value) AS churned_customers,
    ROUND(SUM(Churn_Value) * 100.0 / COUNT(*), 2) AS churn_rate
FROM telco_churn;

-- ============================================================
-- Contract Type Analysis
-- Compare customer churn across different contract types
-- ============================================================

SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(Churn_Value) AS churned_customers,
    ROUND(SUM(Churn_Value) * 100.0 / COUNT(*), 2) AS churn_rate
FROM telco_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

-- ============================================================
-- Internet Service Analysis
-- Identify which internet service category has
-- the highest customer churn
-- ============================================================

SELECT
    Internet_Service,
    COUNT(*) AS total_customers,
    SUM(Churn_Value) AS churned_customers,
    ROUND(SUM(Churn_Value) * 100.0 / COUNT(*), 2) AS churn_rate
FROM telco_churn
GROUP BY Internet_Service
ORDER BY churn_rate DESC;

-- ============================================================
-- Payment Method Analysis
-- Evaluate customer churn across different
-- payment methods
-- ============================================================

SELECT
    Payment_Method,
    COUNT(*) AS total_customers,
    SUM(Churn_Value) AS churned_customers,
    ROUND(SUM(Churn_Value) * 100.0 / COUNT(*), 2) AS churn_rate
FROM telco_churn
GROUP BY Payment_Method
ORDER BY churn_rate DESC;

-- ============================================================
-- Churn Reason Analysis
-- Identify the most common reasons why customers churn
-- ============================================================

SELECT
    Churn_Reason,
    COUNT(*) AS churned_customers
FROM telco_churn
WHERE Churn_Value = 1
GROUP BY Churn_Reason
ORDER BY churned_customers DESC;

-- ============================================================
-- End of SQL Exploratory Analysis
-- Results from these queries are used to build
-- the Power BI dashboard and support machine
-- learning-based customer churn prediction.
-- ============================================================