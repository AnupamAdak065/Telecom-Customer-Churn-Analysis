#  📊 Telecom Customer Churn Analysis Report

## 📌 Table of Contents
- <a href="#Introduction">Introduction</a>
- <a href="#Dataset-Information">Dataset Information</a>
- <a href="#Tools">Tools & Technologies</a>
- <a href="#kpis">Key Calculations & KPIs</a>
- <a href="#observation">Detailed Observations</a>
- <a href="#recommendation">Recommendations</a>
- <a href="#dashboard">Dashboard Previews</a>
- <a href="#conclution">Conclution</a>


---
<h2><a class="anchor" id="Introduction"></a>1. Introduction</h2>

This project analyzes customer churn for a telecom company using SQL Server, Power BI, and Excel. The dataset consists of 7,043 customers with detailed demographic, service usage, billing, and churn information.
The primary objectives of this analysis are:

 -To identify patterns that differentiate churned customers from retained customers.
 -To understand the main drivers of churn.
 -To recommend strategies that can help reduce churn and    improve   retention.
 -To create an interactive dashboard for business stakeholders.

---
<h2><a class="anchor" id="Dataset-Information"></a>2. Dataset Information</h2>

The dataset was sourced from Kaggle and contains 7,043 rows and 23 attributes.

Key Features:
 -Demographics: Gender, Senior Citizen, Partner, Dependents.
 -Services: Phone Service, Internet Service, Online Security, Backup, Device Protection, Tech Support, Streaming.
 -Billing & Contracts: Monthly Charges, Total Charges, Payment Method, Contract Type,  Paperless Billing.
 -Support: Number of Administrative and Technical Tickets.
 -Target Variable: Churn (Yes/No).

 🔗 [Data Link](https://www.linkedin.com/in/ayushi-mishra-30813b174/)  

---
<h2><a class="anchor" id="Tools"></a>3. Tools & Technologies</h2>

 -Python (Numpy, Pandas, Matplotlib, Seaborn)
 -MySQL (Common Table Expressions, Joins, Filtering)
 -Power BI (Interactive Visualizations)
 -Excel (preliminary checks and dataset validation)

---
<h2><a class="anchor" id="kpis"></a>4. Key Calculations & KPIs</h2>

 -Total Customers: 7,043
 -Churned Customers: 1,868
 -Churn Rate: 26.5%
 -Average Monthly Charges: $64.8
 -Total Revenue: $16.1 Million

---
<h2><a class="anchor" id="observation"></a>5. Detailed Observations</h2>

1. Customers using Fiber Optic Internet and paying via Electronic Check show the highest churn rate.

2. Gender is not a significant factor — churn rates are similar for both male and female customers.

3. Customers less likely to churn include:

 -Those with partners or dependents.
 -Customers on long-term contracts (1-year, 2-year).
 -Customers paying via Credit Card Auto-pay.

4. Among churned customers, usage of Online Security, Online Backup, Device Protection, and Tech Support is very low, suggesting poor adoption of retention-related services.

---
<h2><a class="anchor" id="recommendation"></a>6. Recommendations</h2>

Service Quality Improvements
 -Address speed, downtime, and pricing issues in Fiber Optic plans.
 -Offer loyalty discounts and bundled add-ons to retain fiber customers.
Payment Method Optimization
 -Encourage customers to switch from Electronic Check to Auto-pay methods (Bank Transfer, Credit Card).
 -Provide incentives such as discounts, cashback, or reward points for auto-pay adoption.
Retention & Contract Strategies
 -Promote long-term contracts (1-year, 2-year) using discounts or bundled offers.
 -Highlight family-friendly benefits like multi-device access for partners and dependents.
Service Adoption Campaigns
 -Run awareness campaigns highlighting the importance of Online Backup, Security, and Device Protection.
 -Provide free trial periods (1–3 months) for these services.
 -Bundle these services at discounted rates with internet/phone plans.
Customer Support Enhancements
 -Train support teams to upsell retention-related services during at-risk customer interactions.

---

<h2><a class="anchor" id="dashboard"></a>7. Dashboard Previews</h2>

### 1️⃣ Overall Customer Dashboard
![All Customer Dashboard](Dashboard\All Customers Dashboard.jpg)
### 2️⃣ Churned Customers Dashboard
![Churn Customer Dashboard](Dashboard\Churned Customer Overview.jpg)

---
<h2><a class="anchor" id="conclution"></a>8. Conclusion</h2>

This project highlights that 26.5% of customers churn, with churn concentrated among Fiber Optic internet users and Electronic Check payers.

Key strategies such as improving service quality, incentivizing auto-pay methods, promoting long-term contracts, and increasing adoption of support-related services can significantly reduce churn.

Implementing these recommendations will not only improve customer retention but also positively impact revenue growth and long-term loyalty.

---
<h2><a class="anchor" id="author--contact"></a>Author & Contact</h2>

**Anupam Adak**  
Data Analyst  
📧 Email: anupamadak6295@gmail.com
