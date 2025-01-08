# Project-3---Bank_Customer_Churn_Analysis

## Business Analysis Project - Bank Customer Churn

### Overview
This project centers around a detailed analysis of bank customer churn data, aiming to derive actionable insights that will enhance understanding of customer retention challenges and overall business performance. The dataset contains critical information on customer demographics, account details, satisfaction scores, and churn status, enabling a comprehensive examination of customer behavior.

### Technical Environment
- **SQL Dialect**: MySQL

### Analysis Tasks

1. **Data Structuring and Cleansing**
   - **Task**: Enhance the dataset by creating new categorical columns.
   - **Details**: Introduced `age_group`, `credit_score_group`, and `balance_group` to categorize customers effectively. Updated these columns to reflect meaningful segments based on age, credit score, and account balance.

2. **Customer Segmentation**
   - **Task**: Segment customers based on geographic, gender, and age distributions.
   - **Details**: Created views to analyze customer characteristics, including average metrics (age, credit score, balance) segmented by geography, gender, and age group.

3. **Churn Rate Analysis**
   - **Task**: Investigate churn rates across different segments.
   - **Details**: Analyzed the percentage of customers who exited the bank, focusing on demographic factors associated with higher churn rates to identify at-risk segments.

4. **Satisfaction Score Analysis**
   - **Task**: Evaluate the relationship between customer satisfaction and churn.
   - **Details**: Compared average satisfaction scores of exited versus retained customers to identify potential areas for improvement, highlighting segments with lower satisfaction.

5. **Customer Lifetime Value Calculation**
   - **Task**: Calculate Customer Lifetime Value (CLV) for different customer segments.
   - **Details**: Assessed average revenue per customer, incorporating churn rates to provide insights into long-term profitability.

6. **Identification of At-Risk Customers**
   - **Task**: Identify customers at risk of churning based on key metrics.
   - **Details**: Flagged customers with low satisfaction scores, specific balance groups, and tenure ranges to enable proactive retention strategies.

7. **Reporting and Visualization**
   - **Task**: Create comprehensive reports and visualizations to present findings.
   - **Details**: Developed SQL queries to generate insights on customer demographics, churn rates, and satisfaction scores, facilitating data-driven decision-making for stakeholders.

### Data Sources
The dataset for this analysis is sourced from Kaggle: Bank Customer Churn https://www.kaggle.com/datasets/radheshyamkollipara/bank-customer-churn. It comprises the following columns:
- RowNumber
- CustomerId
- CreditScore
- Geography
- Gender
- Age
- Tenure
- Balance
- NumOfProducts
- HasCrCard
- IsActiveMember
- EstimatedSalary
- Exited
- Satisfaction Score
- Card Type
- Point Earned

### Project Files
- **README.md**: This document.
- **project_bank_customer_churn.sql**: SQL script for analysis.

### Getting Started
1. Clone this repository to your local machine.
2. Open MySQL Workbench or any SQL IDE to run the analysis.

### Usage
You can replicate the analysis by executing the provided SQL queries against the included datasets or datasets with similar structures.

### Conclusion
This project aims to provide in-depth insights into bank customer churn, focusing on customer behavior, satisfaction metrics, and retention strategies. The findings will assist stakeholders in making informed decisions to enhance customer loyalty and reduce attrition rates.

For any questions or further information, feel free to reach out.

**Author**: Ho Sing Andy CHAU  
**Email**: hosingchau@outlook.com  
**Date**: 8 JAN 2025

### Logical Sequence Explanation
1. Data Structuring establishes a framework for effective analysis.
2. Customer Segmentation identifies critical demographics and behavioral patterns.
3. Churn Rate Analysis highlights segments that require targeted retention efforts.
4. Satisfaction Score Analysis provides insights into customer experience.
5. Customer Lifetime Value Calculation informs financial strategies.
6. Identification of At-Risk Customers enables proactive engagement.
7. Reporting and Visualization effectively communicate insights to support strategic decision-making.
