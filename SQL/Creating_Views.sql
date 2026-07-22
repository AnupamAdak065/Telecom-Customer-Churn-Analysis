CREATE VIEW vw_Telco_Customers AS
     SELECT * FROM [dbo].[Telco_Customer_Churn] WHERE Churn IN ('Yes', 'No')


CREATE VIEW vw_Telco_Churn_Customers AS
     SELECT * FROM [dbo].[Telco_Customer_Churn] WHERE Churn = 'Yes'


SELECT TOP 10 * FROM [dbo].[vw_Telco_Customers];
SELECT TOP 10 * FROM [dbo].[vw_Telco_Churn_Customers];