SELECT * FROM sqltutorial.`call center`;

-- Data cleaning 
SET SQL_SAFE_UPDATES = 0;

--- changing date format---
UPDATE sqltutorial.`call center` 
SET call_timestamp = str_to_date(call_timestamp, "%m/%d/%Y");

-- updating empty values to NUll
UPDATE sqltutorial.`call center`
SET csat_score = null
WHERE csat_score = '';
SET SQL_SAFE_UPDATES = 1;

-- Count of num of rows and num of columns in table
SELECT COUNT(*) AS num_rows FROM sqltutorial.`call center`;
SELECT COUNT(*) AS num_columns
FROM information_schema.columns
WHERE table_name = 'call center' AND table_schema = 'sqltutorial';

-- to select distinct values in each column
SELECT DISTINCT sentiment FROM sqltutorial.`call center`;
SELECT DISTINCT reason FROM sqltutorial.`call center`;
SELECT DISTINCT city FROM sqltutorial.`call center`;
SELECT DISTINCT channel FROM sqltutorial.`call center`;
SELECT DISTINCT call_center FROM sqltutorial.`call center`;

-- to count and % from total of each distinct values in a column in call_center table
SELECT city,
	COUNT(*) AS count,
    COUNT(*) * 100 / (SELECT COUNT(*) FROM sqltutorial.`call center`) AS percentage
    FROM sqltutorial.`call center`
    GROUP BY city
    ORDER BY count DESC;
	
-- Call count of=n each day
SELECT DAYNAME(call_timestamp) AS day_of_week,
COUNT(*) AS call_count
FROM sqltutorial.`call center`
GROUP BY day_of_week
ORDER BY call_count DESC;

-- Calculations 
SELECT
	MIN(`call duration in minutes`) AS min_duration,
    MAX(`call duration in minutes`) AS max_duration,
    AVG(`call duration in minutes`) AS avg_duration
FROM sqltutorial.`call center`;

SELECT 
	MIN(csat_score) AS min_csat,
    MAX(csat_score) AS max_csat,
    ROUND(AVG(csat_score), 2) AS avg_csat
FROM sqltutorial.`call center`
WHERE csat_score != 0;

SELECT call_center, response_time, COUNT(*) as count
FROM sqltutorial.`call center`
GROUP BY 1,2
order by 1,3 DESC;

SELECT 
	DATE(call_timestamp) AS call_day,
    MAX(`call duration in minutes`) AS max_call_duration
FROM sqltutorial.`call center`
GROUP BY call_day
order by call_day;