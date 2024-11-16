--- To read Data ---
SELECT * FROM sqltutorial.`employee trends`;

-- 1. Count the number of employees in each department
SELECT department, COUNT(*) AS employee_count
FROM sqltutorial.`employee trends`
GROUP BY department;

-- 2.Calculate the average age for each department
SELECT department, AVG(age) AS Avergae_Age
FROM sqltutorial.`employee trends`
GROUP BY department;

-- 3. Identify the most common job roles in each department
SELECT department, job_role, COUNT(*) AS role_count 
FROM sqltutorial.`employee trends`
GROUP BY department, job_role
ORDER BY department, role_count DESC;

-- 4. Calculate the average job satisfaction for each education level 
SELECT education, AVG(job_satisfaction) AS satisfation_rate
FROM sqltutorial.`employee trends`
group by education
order by satisfation_rate DESC;

-- 5.Determine the average age for employees with different levels of job satisfaction
SELECT job_satisfaction, AVG(age) AS average_age
FROM sqltutorial.`employee trends`
GROUP BY job_satisfaction;

-- 6. Calculate the attrition rate for each age band
SELECT age_band, SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS attrition_rate
FROM sqltutorial.`employee trends`
GROUP BY age_band;

-- 7. Identify the departments with the highest and lowest average job satisfaction
SELECT department, AVG(job_satisfaction) AS average_satisfaction
FROM sqltutorial.`employee trends`
GROUP BY department
ORDER BY average_satisfaction DESC, department;

-- 8. Find the age band with the highest attrition rate among employees with a specific education level
SELECT education, age_band, SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS attrition_rate
FROM sqltutorial.`employee trends`
GROUP BY education, age_band
ORDER BY attrition_rate DESC;

-- 9.Find the education level with the highest average job satisfaction among employees who travel frequently
SELECT education, AVG(job_satisfaction) AS average_satisfaction
FROM sqltutorial.`employee trends`
WHERE business_travel = 'Travel_Frequently'
GROUP BY education
ORDER BY average_satisfaction DESC;

-- 10. Identify the age band with the highest average job satisfaction among married employees
SELECT age_band, AVG(job_satisfaction) AS average_satisfaction
FROM sqltutorial.`employee trends`
WHERE marital_status = 'Married'
GROUP BY age_band
ORDER BY average_satisfaction DESC;