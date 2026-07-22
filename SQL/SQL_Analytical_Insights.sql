-- Creating Database TEL_CHURN
CREATE DATABASE TEL_CHURN;

USE TEL_CHURN;

SELECT TOP 10 * FROM Telco_Customer_Churn;

------- Checking how many rows are inserted 
SELECT COUNT(*) AS Total_Rows FROM [dbo].[Telco_Customer_Churn];

------- Null Value Checks
SELECT 
     SUM(CASE WHEN customerID IS NULL THEN 1 ELSE 0 END) AS customerID_nulls,
     SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS gender_nulls,
     SUM(CASE WHEN SeniorCitizen IS NULL THEN 1 ELSE 0 END) AS senior_citizen_nulls,
     SUM(CASE WHEN Partner IS NULL THEN 1 ELSE 0 END) AS Partner_nulls,
     SUM(CASE WHEN Dependents IS NULL THEN 1 ELSE 0 END) AS Dependents_nulls,
     SUM(CASE WHEN tenure IS NULL THEN 1 ELSE 0 END) AS tenure_nulls,
     SUM(CASE WHEN PhoneService IS NULL THEN 1 ELSE 0 END) AS PhoneService_nulls,
     SUM(CASE WHEN MultipleLines IS NULL THEN 1 ELSE 0 END) AS MultipleLines_nulls,
     SUM(CASE WHEN InternetService IS NULL THEN 1 ELSE 0 END) AS InternetService_nulls,
     SUM(CASE WHEN OnlineSecurity IS NULL THEN 1 ELSE 0 END) AS OnlineSecurity_nulls,
     SUM(CASE WHEN OnlineBackup IS NULL THEN 1 ELSE 0 END) AS OnlineBackup_nulls,
     SUM(CASE WHEN DeviceProtection IS NULL THEN 1 ELSE 0 END) AS DeviceProtection_nulls,
     SUM(CASE WHEN TechSupport IS NULL THEN 1 ELSE 0 END) AS TechSupport_nulls,
     SUM(CASE WHEN StreamingTV IS NULL THEN 1 ELSE 0 END) AS StreamingTV_nulls,
     SUM(CASE WHEN StreamingMovies IS NULL THEN 1 ELSE 0 END) AS StreamingMovies_nulls,
     SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END) AS Contract_nulls,
     SUM(CASE WHEN PaperlessBilling IS NULL THEN 1 ELSE 0 END) AS PaperlessBilling_nulls,
     SUM(CASE WHEN PaymentMethod IS NULL THEN 1 ELSE 0 END) AS PaymentMethod_nulls,
     SUM(CASE WHEN MonthlyCharges IS NULL THEN 1 ELSE 0 END) AS MonthlyCharges_nulls,
     SUM(CASE WHEN TotalCharges IS NULL THEN 1 ELSE 0 END) AS TotalCharges_nulls,
     SUM(CASE WHEN Churn IS NULL THEN 1 ELSE 0 END) AS Churn_nulls
FROM Telco_Customer_Churn;

------ Updating NULL values of TotalCharges columns to 0
UPDATE Telco_Customer_Churn
SET TotalCharges = 0
WHERE TotalCharges IS NULL;

/* DUPLICATE CHECK USING CUSTOMER_ID 
(Customer can have multiple orders, so duplicates ARE expected.We DO NOT delete them.) */
SELECT customerID, COUNT(*) AS occurrence
FROM Telco_Customer_Churn
GROUP BY customerID
HAVING COUNT(*) > 1;

--------------------------KPI's----------------------------

------ Total Customers
SELECT COUNT(*) AS Total_Customers
FROM Telco_Customer_Churn;

------ No. of Churned Customers
SELECT COUNT(*) AS Churned_Customer
FROM Telco_Customer_Churn
WHERE Churn = 'Yes';

------ Churn Percentage
SELECT 
CAST(
     COUNT(Churn) * 100.0 / (SELECT COUNT(*) FROM Telco_Customer_Churn) AS DECIMAL(5,2)
     ) AS Churn_Percentage
FROM Telco_Customer_Churn
WHERE Churn = 'Yes';

------ Avg. Monthly Charges
SELECT 
CAST(
     AVG(MonthlyCHarges) AS DECIMAL(5,2)
     ) AS Average_Monthly_Charges 
FROM Telco_Customer_Churn;

------ Total Revenue
SELECT 
CAST(
     SUM(TotalCharges) AS DECIMAL(10,2)
     ) AS Total_Revenue 
FROM Telco_Customer_Churn;

------------------------- Analytical Insights-------------------------

------ No of Male & Female Customers
SELECT gender, COUNT(gender) AS Number,
CAST(
      COUNT(gender) * 100.0 / (SELECT COUNT(*) FROM Telco_Customer_Churn) AS DECIMAL(5,2)
      ) AS Percentage
FROM Telco_Customer_Churn GROUP BY gender;

------ No of Senior Citizen Customers
SELECT COUNT(*) AS No_of_Senior_Citizen,
CAST(
      COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Telco_Customer_Churn) AS DECIMAL(5,2)
      ) AS Percentage
FROM Telco_Customer_Churn 
WHERE SeniorCitizen = 1;

------ No of Customers have Partner
SELECT COUNT(*) AS Customers_have_partners,
CAST(
      COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Telco_Customer_Churn) AS DECIMAL(5,2)
      ) AS Percentage
FROM Telco_Customer_Churn 
WHERE Partner = 'Yes';

------- Average Customer Tenure
SELECT AVG(tenure) AS Average_Tenure 
FROM Telco_Customer_Churn;

------- Type of Internet Service
SELECT InternetService,
COUNT(InternetService) AS Numbers,
CAST(
      COUNT(InternetService) * 100.0 / (SELECT COUNT(*) FROM Telco_Customer_Churn) AS DECIMAL(5,2)
      ) AS Percentage
FROM Telco_Customer_Churn
GROUP BY InternetService;

-------- Contract Month Distribution
SELECT Contract,
COUNT(Contract) AS Numbers,
CAST(
      COUNT(Contract) * 100.0 / (SELECT COUNT(*) FROM Telco_Customer_Churn) AS DECIMAL(5,2)
      ) AS Percentage
FROM Telco_Customer_Churn
GROUP BY Contract;

-------- Payment Methods Per Customer
SELECT PaymentMethod,
COUNT(PaymentMethod) AS Numbers,
CAST(
      COUNT(PaymentMethod) * 100.0 / (SELECT COUNT(*) FROM Telco_Customer_Churn) AS DECIMAL(5,2)
      ) AS Percentage
FROM Telco_Customer_Churn
GROUP BY PaymentMethod;

--------- Avg Monthly Charges By Contract
SELECT Contract,
CAST(AVG(MonthlyCharges) AS DECIMAL(5,2)) AS Avg_Monthly_Charge
FROM Telco_Customer_Churn
GROUP BY Contract;

------------------------------  For Churned Customers  -------------------------

----- No of Churned Customer by Gender
WITH churn_customer AS(
      SELECT * FROM Telco_Customer_Churn
      WHERE Churn = 'Yes'
)
SELECT gender, COUNT(gender) AS Total
FROM churn_customer
GROUP BY gender;

----- Churn Customer with No(0) SeniorCitizen 
WITH churn_customer AS(
      SELECT * FROM Telco_Customer_Churn
      WHERE Churn = 'Yes'
)
SELECT COUNT(SeniorCitizen) AS With_No_SeniorCitizen
FROM churn_customer
WHERE SeniorCitizen = 0;

----- Churn Customer with No Partner
WITH churn_customer AS(
      SELECT * FROM Telco_Customer_Churn
      WHERE Churn = 'Yes'
)
SELECT COUNT(Partner) AS With_No_Partner
FROM churn_customer
WHERE Partner = 'No';

----- Churn Customer with No Dependents
WITH churn_customer AS(
      SELECT * FROM Telco_Customer_Churn
      WHERE Churn = 'Yes'
)
SELECT COUNT(Dependents) AS With_No_Dependents
FROM churn_customer
WHERE Dependents = 'No';

----- Avg Tenure of Churn Customer
WITH churn_customer AS(
      SELECT * FROM Telco_Customer_Churn
      WHERE Churn = 'Yes'
)
SELECT AVG(tenure) AS Avg_Tenure
FROM churn_customer;

----- Churn Customer with Diff Internet Service
WITH churn_customer AS(
      SELECT * FROM Telco_Customer_Churn
      WHERE Churn = 'Yes'
)
SELECT InternetService, COUNT(InternetService) AS Total
FROM churn_customer
GROUP BY InternetService;

----- Churn Customer with Diff Contract
WITH churn_customer AS(
      SELECT * FROM Telco_Customer_Churn
      WHERE Churn = 'Yes'
)
SELECT Contract, COUNT(Contract) AS Total
FROM churn_customer
GROUP BY Contract;

----- Churn Customer with PaymentMethod
WITH churn_customer AS(
      SELECT * FROM Telco_Customer_Churn
      WHERE Churn = 'Yes'
)
SELECT PaymentMethod, COUNT(PaymentMethod) AS Total
FROM churn_customer
GROUP BY PaymentMethod;

----- Churn Customers have OnlineBackup, OnlineSecurity, DeviceProtection, TechSupport
WITH churn_customer AS(
      SELECT * FROM Telco_Customer_Churn
      WHERE Churn = 'Yes'
)
SELECT 
COUNT(OnlineBackup) AS OnlineBackup, 
COUNT(OnlineSecurity) AS OnlineSecurity, 
COUNT(DeviceProtection) AS DeviceProtection, 
COUNT(TechSupport) AS TechSupport 
FROM churn_customer
WHERE OnlineBackup = 'Yes'
AND OnlineSecurity = 'Yes'
AND DeviceProtection = 'Yes'
AND TechSupport = 'Yes';

/* 
Observation for Churn Customer --
1. Customers using Fiber Optic Internet and paying via Electronic Check show the highest churn rate.

2. The gender distribution is almost equal, churn is not significantly influenced by gender.

3. Customers less likely to churn include:
     * Those with no Dependents
     * Those with no Senior Citizen
     * Those with no Partners
     * Those with 

4. Among Churn customers, adoption of Online Backup, Online Security, Device Protection, Tech Support is very low, suggesting these services werw either undervalued or underutilized.
*/