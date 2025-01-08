https://www.kaggle.com/datasets/radheshyamkollipara/bank-customer-churn 
SELECT * FROM bank_churn.bank_customer_churn;

SELECT * FROM bank_churn.bank_customer_churn;
ALTER TABLE bank_customer_churn 
ADD COLUMN age_group VARCHAR(40),
ADD COLUMN credit_score_group VARCHAR(40)
ADD COLUMN balance_group VARCHAR(40);

UPDATE bank_customer_churn 
SET age_group = CASE
	WHEN Age BETWEEN 18 AND 24 THEN '18-24: Young Adults'
	WHEN Age BETWEEN 25 AND 34 THEN '25-34: Young Professionals'
    WHEN Age BETWEEN 35 AND 44 THEN '35-44: Middle-aged Adults'
	WHEN Age BETWEEN 45 AND 54 THEN '45-54: Older Middle-aged Adults'
	WHEN Age BETWEEN 55 AND 64 THEN '55-64: Pre-Retirement'
	WHEN Age >= 65 THEN '65 and above: Seniors'
	ELSE 'Unknown'
END;

UPDATE bank_customer_churn 
SET credit_score_group = CASE 
	WHEN CreditScore BETWEEN 300 AND 400 THEN '300-400'
	WHEN CreditScore BETWEEN 401 AND 500 THEN '401-500'
    WHEN CreditScore BETWEEN 501 AND 600 THEN '501-600'
	WHEN CreditScore BETWEEN 601 AND 700 THEN '601-700'
	WHEN CreditScore BETWEEN 701 AND 800 THEN '701-800'
	WHEN CreditScore >= 801 THEN '801+'
	ELSE 'Unknown'
END;

UPDATE bank_customer_churn
SET balance_group = CASE
	WHEN balance < 50000 THEN '0 - 49,999'
	WHEN balance BETWEEN 50000 AND 99999 THEN '50,000 - 99,999'
	WHEN balance BETWEEN 100000 AND 149999 THEN '100,000 - 149,999'
	WHEN balance BETWEEN 150000 AND 199999 THEN '150,000 - 199,999'
	WHEN balance >= 200000 THEN '200,000+'
END;

ALTER TABLE bank_customer_churn
CHANGE `Satisfaction Score` satisfaction_score tinyint;

ALTER TABLE bank_customer_churn
CHANGE `Point Earned` point_earned bigint;

ALTER TABLE bank_customer_churn
CHANGE `Card Type` card_type text;

ALTER TABLE bank_customer_churn
DROP COLUMN Surname;

#Churn modelling 
#Create table for storing existed customers
CREATE TABLE exited AS
	SELECT * 
    FROM bank_customer_churn
    WHERE exited = 1

#customer segmentation 
#Geographic, gender and age distirbution 
CREATE VIEW all_customer AS
	SELECT geography, 
		gender,
		age_group,
		count(*) AS counts,
        ROUND(AVG(Age), 2) AS avg_age,
		ROUND(AVG(CreditScore), 2) AS avg_credit_score,
        ROUND(AVG(Tenure), 2) AS avg_tenure,	
		ROUND(AVG(Balance), 2) AS avg_bal,
		ROUND(AVG(EstimatedSalary), 2) AS avg_salary,
		ROUND(AVG(point_earned), 2) AS avg_point_earned,
        ROUND(AVG(NumOfProducts), 2) AS avg_num_of_product,
        ROUND(AVG(HasCrCard), 2) AS avg_num_of_have_crcard,
        ROUND(AVG(IsActiveMember), 2) AS avg_num_of_active,
        ROUND(AVG(satisfaction_score), 2) AS avg_satisfaction_score
	FROM bank_customer_churn
	GROUP BY geography, gender, age_group
	ORDER BY geography, age_group, gender;


CREATE VIEW exited_customer AS
	SELECT geography, 
		gender,
		age_group,
		count(*) AS counts_exited,
        ROUND(AVG(Age), 2) AS avg_age,
		ROUND(AVG(CreditScore), 2) AS avg_credit_score,
        ROUND(AVG(Tenure), 2) AS avg_tenure,	
		ROUND(AVG(Balance), 2) AS avg_bal,
		ROUND(AVG(EstimatedSalary), 2) AS avg_salary,
		ROUND(AVG(point_earned), 2) AS avg_point_earned,
        ROUND(AVG(NumOfProducts), 2) AS avg_num_of_product,
        ROUND(AVG(HasCrCard), 2) AS avg_num_of_have_crcard,
        ROUND(AVG(IsActiveMember), 2) AS avg_num_of_active,
        ROUND(AVG(satisfaction_score), 2) AS avg_satisfaction_score
	FROM exited
    WHERE Exited = 1
	GROUP BY geography, gender, age_group
	ORDER BY geography, age_group, gender;

CREATE VIEW stayed_customer AS
	SELECT geography, 
		gender,
		age_group,
		count(*) AS counts,
        ROUND(AVG(Age), 2) AS avg_age,
		ROUND(AVG(CreditScore), 2) AS avg_credit_score,
        ROUND(AVG(Tenure), 2) AS avg_tenure,	
		ROUND(AVG(Balance), 2) AS avg_bal,
		ROUND(AVG(EstimatedSalary), 2) AS avg_salary,
		ROUND(AVG(point_earned), 2) AS avg_point_earned,
        ROUND(AVG(NumOfProducts), 2) AS avg_num_of_product,
        ROUND(AVG(HasCrCard), 2) AS avg_num_of_have_crcard,
        ROUND(AVG(IsActiveMember), 2) AS avg_num_of_active,
        ROUND(AVG(satisfaction_score), 2) AS avg_satisfaction_score
	FROM bank_customer_churn
    WHERE EXITED = 0 
	GROUP BY geography, gender, age_group
	ORDER BY geography, age_group, gender;
    
#churn rate analysis 
SELECT a.geography,
	a.gender,
    a.age_group,
    a.counts,
    e.counts_exited,
    CONCAT(ROUND(counts_exited / counts * 100, 2), '%') AS percentage_loss
FROM all_customer a 
JOIN exited_customer e
	ON a.geography = e.geography 
		AND a.gender = e.gender
		AND a.age_group = e.age_group
WHERE CONCAT(ROUND(counts_exited / counts * 100, 2), '%') > 50


#Compare the average metrics (e.g., age, credit score, balance) between all customers and exited customers to identify significant differences.
SELECT 
    a.geography, 
    a.gender, 
    a.age_group,
    ROUND(a.avg_bal - e.avg_bal, 2) AS avg_bal_different_from_all_customer,
	a.avg_credit_score - e.avg_credit_score AS avg_credit_score_different_from_all_customer,
    a.avg_tenure - e.avg_tenure AS avg_tenure_different_from_all_customer,
    ROUND(a.avg_salary - e.avg_salary, 2) AS avg_salary_different_from_all_customer,
	a.avg_point_earned - e.avg_point_earned AS avg_point_earned_different_from_all_customer
FROM all_customer a
LEFT JOIN exited_customer e
	ON a.geography = e.geography 
		AND a.gender = e.gender 
		AND a.age_group = e.age_group;

#Satisfaction score analysis 
SELECT 
    a.geography, 
    a.gender, 
    a.age_group,
    AVG(e.avg_satisfaction_score) AS avg_satisfaction_exited,
    AVG(a.avg_satisfaction_score) AS avg_satisfaction_all
FROM all_customer a
LEFT JOIN exited_customer e 
	ON a.geography = e.geography 
		AND a.gender = e.gender 
        AND a.age_group = e.age_group
GROUP BY a.geography, a.gender, a.age_group
ORDER BY avg_satisfaction_exited DESC


#Card Type Performance Analysis: identify the top age_group exited in each card_type
WITH exited_card_type AS(
	SELECT card_type,
		age_group, 
		COUNT(age_group) AS counts
	FROM bank_customer_churn 
    WHERE exited =1
    GROUP BY card_type, age_group
    ORDER BY card_type, counts DESC
), rnk AS(
    SELECT
		*,
        RANK() OVER (PARTITION BY card_type ORDER BY counts DESC) AS rnk
	FROM exited_card_type
)
SELECT bc.card_type, 
	COUNT(*) AS count, 
    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) AS exited_count,
     AVG(satisfaction_score) AS avg_satisfaction,
    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) / COUNT(*) AS churn_rate, 
    MAX(rnk.age_group) AS max_exited_age_group,
    MAX(rnk.counts) AS max_exited_age_group_counts,
    ROUND(MAX(rnk.counts)/ SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) ,2) AS max_exited_age_group_churn_rate_within_card_type
FROM bank_customer_churn bc
LEFT JOIN rnk
ON bc.card_type = rnk.card_type and rnk.rnk =1
GROUP BY card_type;



#Geographic analysis for exited
WITH temp AS(
	SELECT geography, count(*) AS total_number_of_customer 
	from bank_customer_churn 
	group by geography
)
SELECT exited.geography, 
	total_number_of_customer AS total_number_of_customer,
	count(*) AS total_exited, 
    count(*) / total_number_of_customer as churn_rate,
    avg(balance) AS avg_bal_of_exited, 
    avg(satisfaction_score) AS avg_satisfaction_score_of_exited, 
    avg(Complain) AS avg_complain_of_exited, 
    avg(tenure) AS avg_tenure_of_exited
FROM exited
JOIN temp
ON temp.geography = exited.geography
GROUP BY exited.geography;




#Customer lifetime value calculation: average revenue per customer : total revenue / total customers
WITH average_and_churn_rate AS(
	SELECT 
		ROUND(AVG(Balance),2) AS avg_balance, 
		ROUND(AVG(NumOfProducts),2) AS avg_num_of_prod,
		SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) / COUNT(*) AS churn_rate
	FROM bank_customer_churn
), arpc AS(
	#assume each product will generate 10,000 for the bank 
	#average revenue per customer: 
	SELECT 
		avg_balance,
        avg_num_of_prod,
        churn_rate,
		(avg_balance + avg_num_of_prod * 10000) AS arpc
	FROM average_and_churn_rate
	)
#CLV 
SELECT 
	(arpc / NULLIF(churn_rate, 0)) AS clv 
from arpc



#idenitify potential customer at risk  base on satisfaction socre,  balance group, tenure, age_group 
#satisfaction score 
SELECT 
	a.geography, 
    a.gender, 
    a.age_group,
    a.avg_satisfaction_score,
	e.avg_satisfaction_score AS exited,
     CONCAT(ROUND(e.counts_exited / a.counts * 100, 2), '%') AS percentage_loss
FROM all_customer a
LEFT JOIN exited_customer e 
	ON a.geography = e.geography 
		AND a.gender = e.gender 
        AND a.age_group = e.age_group
WHERE CONCAT(ROUND(e.counts_exited / a.counts * 100, 2), '%') > 50;

#overall satisfaction average of exited
select avg(satisfaction_score) from bank_customer_churn where exited = 1
#FROM the above if saitisfaction score is lower/equal to 3 then it will idenitfy as at risk 

#balance group
SELECT 
	balance_group,
	COUNT(*) AS total ,
    COUNT(CASE WHEN Exited =1 THEN 1 END) AS exited,
    COUNT(CASE WHEN Exited =1 THEN 1 END) / COUNT(*) AS churn_rate
FROM bank_customer_churn
GROUP BY balance_group;
#it is identified that balance groups '100,000-149,999' and '200,000+' are the top 2 in  churn rate

#tenure 
SELECT AVG(tenure), MAX(tenure), MIN(tenure) FROM bank_customer_churn WHERE exited =1;
SELECT AVG(tenure), MAX(tenure), MIN(tenure) FROM bank_customer_churn;
#the avgerage tenure of exit customer is around 4-5 years, thus bank should be aware of customer with tenure between 3-5 years to consolidate relationships to avoid churn 

#Identify segments with the highest churn risk based on demographic and behavioral characteristics.
SELECT 
    *,
    (satisfaction_score <= 3 
		AND balance_group IN( '100,000 - 149,999','200,000+')
        and age_group IN( '45-54: Older Middle-aged Adults' , '55-64: Pre-Retirement')
        AND tenure BETWEEN 3 AND 5
        ) AS at_risk
FROM bank_customer_churn
WHERE  (satisfaction_score <= 3 
		AND balance_group IN( '100,000 - 149,999','200,000+')
        AND age_group IN( '45-54: Older Middle-aged Adults' , '55-64: Pre-Retirement')
        AND tenure BETWEEN 3 AND 5) = 1;
# German should be prioritse in relationship consolidation due to the high churn rate records


