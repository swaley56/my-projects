USE hr; 

# This SQL pulls 10 random rows 
SELECT * FROM employee ORDER BY RAND() LIMIT 10;

# Count number of employees grouped by churn/not churn
# Conclusion: Based on the data, it seems that left = 1 represents churned employee
SELECT 
`left` AS employee_left,
COUNT(*) AS employee_count
FROM employee 
GROUP BY employee_left;  

# Overall Analysis 
# Conclusion: 
# 1. employee who left have lower satisfaction and higher average hours, which will be further examined in the excel later. 
# 2. employee who have left have a lower promotion rate.
# 3. also, it is interesting to observe that employees who stay at the company have higher accident rate. 
SELECT 
`left` AS employee_left, 
AVG(satisfaction_level) AS satisfaction_level,
AVG(last_evaluation) AS last_evaluation, 
AVG(number_project) AS number_project ,
AVG(average_montly_hours) AS average_montly_hours, 
AVG(time_spend_company) AS time_spend_company, 
AVG(work_accident) AS accident_rate,
SUM(promotion_last_5years) / COUNT(*) AS promotion_rate,
# We will learn CASE WHEN in lesson 6.  
AVG(CASE 
		WHEN salary = 'low' THEN 1 
		WHEN salary = 'medium' THEN 2 
        ELSE 3 
	END) AS avg_salary_band  
FROM hr.employee 
GROUP BY employee_left;

# By Department
# Conclusion: 
# 1. HR has highest churn rate, while managment has the lowest churn rate
# 2. We will further examime some correlations between churn rate and other metrics
SELECT 
sales AS department, 
# Churn Rate: employee churned / total employee 
SUM(`left`) / COUNT(*) AS churn_rate, 
AVG(satisfaction_level) AS satisfaction_level,
AVG(last_evaluation) AS last_evaluation, 
AVG(number_project) AS number_project ,
AVG(average_montly_hours) AS average_montly_hours, 
AVG(time_spend_company) AS time_spend_company, 
AVG(work_accident) AS accident_rate,
SUM(promotion_last_5years) / COUNT(*) AS promotion_rate, 
AVG(CASE 
		WHEN salary = 'low' THEN 1 
		WHEN salary = 'medium' THEN 2 
        ELSE 3 
	END) AS avg_salary_band  
FROM hr.employee 
GROUP BY department
# Order the data by churn_rate in descending order
ORDER BY churn_rate DESC; 

# High Performers: evaluation higher than avg OR longer than 4 years OR more than 5 projects
# Conclusion: 
# High Performers are less likely to churn, which should be a healthy signal. 

# This a sub_query, which is often used to process the data. Ping me if you are interested to learn more. 
WITH sub_query AS 
(SELECT 
*,
 # "avg(last_evaluation) OVER()" is a window function to calculate the a metric over the whole databse   
IF( 
	last_evaluation > avg(last_evaluation) OVER()  # evaluation higher than avg 
    OR time_spend_company >=4 
    OR number_project >=5, 
    'High Performer', 'Regular Employee') AS performance 
FROM hr.employee ) 
SELECT 
performance, 
SUM(`left`) / COUNT(*) AS churn_rate, 
AVG(satisfaction_level) AS satisfaction_level,
AVG(last_evaluation) AS last_evaluation, 
AVG(number_project) AS number_project ,
AVG(average_montly_hours) AS average_montly_hours, 
AVG(time_spend_company) AS time_spend_company, 
AVG(work_accident) AS accident_rate,
SUM(promotion_last_5years) / COUNT(*) AS promotion_rate, 
AVG(CASE 
		WHEN salary = 'low' THEN 1 
		WHEN salary = 'medium' THEN 2 
        ELSE 3 
	END) AS avg_salary_band 
FROM sub_query
GROUP BY 1
ORDER BY churn_rate DESC; 
