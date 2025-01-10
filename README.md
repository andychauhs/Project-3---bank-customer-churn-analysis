# Project-3---Bank_Customer_Churn_Analysis

## Business Analysis Project - Bank Customer Churn

### Overview
This project centers around a detailed analysis of bank customer churn data, aiming to derive actionable insights that will enhance understanding of customer retention challenges and overall business performance. The dataset contains critical information on customer demographics, account details, satisfaction scores, and churn status, enabling a comprehensive examination of customer behavior.

### Technical Environment
- **SQL Dialect**: MySQL

### Analysis Tasks

1. **Data Structuring and Cleansing**
   - **Task**: Enhance the dataset by creating new categorical columns.
   - **Details**: Introduced `age_group`, `credit_score_group`, and `balance_group` to categorise customers effectively. Updated these columns to reflect meaningful segments based on age, credit score, and account balance.

2. **Customer Segmentation**
   - **Task**: Segment customers based on geographic, gender, and age distributions.
   - **Details**: Created views to analyse customer characteristics, including average metrics (age, credit score, balance) segmented by geography, gender, and age group.

3. **Churn Rate Analysis**
   - **Task**: Investigate churn rates across different segments.
   - **Details**: Analysed the percentage of customers who exited the bank, focusing on demographic factors associated with higher churn rates to identify at-risk segments.

4. **Satisfaction Score Analysis**
   - **Task**: Evaluate the relationship between customer satisfaction and churn.
   - **Details**: Compared average satisfaction scores of exited versus retained customers to identify potential areas for improvement, highlighting segments with lower satisfaction.

5. **Customer Lifetime Value Calculation**
   - **Task**: Calculate Customer Lifetime Value (CLV) for different customer segments.
   - **Details**: Assessed average revenue per customer, incorporating churn rates to provide insights into long-term profitability.

6. **Identification of At-Risk Customers**
   - **Task**: Identify customers at risk of churning based on key metrics.
   - **Details**: Flagged customers with low satisfaction scores, specific balance groups, and tenure ranges to enable proactive retention strategies.

7. **Reporting and Visualisation**
   - **Task**: Create comprehensive reports and visualisations to present findings.
   - **Details**: Developed SQL queries to generate insights on customer demographics, churn rates, and satisfaction scores, facilitating data-driven decision-making for stakeholders.

### Data Sources
The dataset for this analysis is sourced from Kaggle: Bank Customer Churn [https://www.kaggle.com/datasets/radheshyamkollipara/bank-customer-churn](https://www.kaggle.com/datasets/radheshyamkollipara/bank-customer-churn). It comprises the following columns:
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

# Findings

## Churn Rates
- The balance groups of **$100,000 - $149,999** and **$200,000+** exhibit the highest churn rates, with rates of **25.77%** and **55.88%**, respectively.
- Germany has the highest overall churn rates among demographics, particularly in the **45-54** and **55-64** age groups, indicating significant customer loss.

## Satisfaction Scores
- The average satisfaction score of exited customers is approximately **2.9975**, suggesting that many customers are dissatisfied prior to exiting.
- Customers with satisfaction scores of **3 or lower** are particularly at risk, especially when they belong to high-balance groups and are in the older age brackets.

## Tenure Analysis
- The average tenure for exited customers is around **4.93 years**, indicating that many customers leave after several years of banking with the institution.
- A significant number of at-risk customers have tenures between **3 to 5 years**, highlighting a critical period where intervention could be effective.

## Demographic Segmentation
- At-risk customers predominantly fall within the **45-54** and **55-64** age groups, with a notable concentration in Germany.
- Gender analysis indicates that both male and female customers in these age groups are at risk, necessitating a gender-neutral approach in retention strategies.

# Insights

## High Value, High Risk
- Customers in the **£200,000+** balance group represent a significant potential loss if they churn, as they contribute substantial revenue. Their high churn rate suggests unmet expectations or dissatisfaction.

## Satisfaction as a Predictor
- The correlation between lower satisfaction scores and higher churn rates demonstrates that customer experience is a critical factor in retention. Even moderately satisfied customers (score of **3**) are susceptible to leaving.

## Behavioural Patterns
- The data reveals that customers are potentially disengaging after several years of banking, particularly those with medium tenure (3-5 years). This suggests that customer engagement strategies may falter over time.

## Geographic Concentration
- Germany stands out as a critical market needing immediate attention due to its high churn rates across multiple demographics. This indicates a potential disconnect between the bank’s offerings and customer needs in this region.

# Recommendations

## Enhance Customer Engagement
- Implement personalised communication and offers tailored to at-risk demographics, particularly focusing on those with lower satisfaction scores. Regular check-ins can help identify issues before they lead to churn.

## Targeted Retention Strategies
- Develop specific retention programmes aimed at high-balance groups, especially those in the **$100,000 - $149,999** and **$200,000+** segments. Consider loyalty programmes, exclusive offers, or personalised financial advice to enhance perceived value.

## Feedback Mechanism
- Establish robust feedback channels to gather insights from at-risk customers. Regular surveys or focus groups can help identify pain points and areas for improvement in services and customer support.

## Tailored Product Offerings
- Create products that cater specifically to the needs of older middle-aged adults (45-64). This could include retirement planning services, investment opportunities, and financial wellness programmes.

## Monitor and Adjust Strategies
- Continuously track churn rates, satisfaction scores, and customer feedback to refine retention strategies. A data-driven approach allows for timely adjustments to meet evolving customer needs.

## Geographic Focus
- Prioritise relationship consolidation efforts in Germany. Conduct market research to understand local customer preferences and adjust services accordingly to enhance satisfaction and loyalty.


# Conclusion

The analysis of bank customer churn reveals critical insights that can drive actionable strategies for improving customer retention. By focusing on high-risk demographics, particularly in the **$200,000+** balance group and the **45-64** age brackets, the bank can tailor its engagement efforts to address the unique needs and expectations of these customers. The significant churn rates in Germany highlight the necessity for targeted interventions in this region, ensuring that the bank's offerings align more closely with customer preferences.

Implementing personalised communication, robust feedback mechanisms, and tailored product offerings will not only enhance customer satisfaction but also foster long-term loyalty. By continuously monitoring key metrics and adjusting strategies based on data-driven insights, the bank can effectively mitigate churn and improve overall business performance. This proactive approach will ultimately lead to a more resilient customer base and sustained profitability.


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
7. Reporting and Visualisation effectively communicate insights to support strategic decision-making.
