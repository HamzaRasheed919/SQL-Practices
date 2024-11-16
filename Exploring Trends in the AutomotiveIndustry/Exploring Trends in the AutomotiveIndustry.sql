-- To read Data
SELECT * FROM sqltutorial.automotive;

-- 1. Calculate the average selling price for cars with a manual transmission and owned by the first owner, for each fuel type.
SELECT fuel, AVG(selling_price) AS avg_selling_price
FROM sqltutorial.automotive
WHERE transmission = 'Manual' AND owner = 'First Owner'
group by fuel;

-- 2. Find the top 3 car models with the highest average mileage, considering only cars with more than 5 seats.
SELECT Name, AVG(mileage) AS avg_mileage
FROM sqltutorial.automotive
WHERE seats > 5
group by Name
order by avg_mileage DESC
LIMIT 3;

-- 3. Identify the car models where the difference between the maximum and minimum selling prices is greater than $10,000.
SELECT NAME
FROM sqltutorial.automotive
group by Name
HAVING MAX(selling_price) AND MIN(selling_price) > 10000;

-- 4. Retrieve the names of cars with a selling price above the overall average selling price and a mileage below the overall average mileage.
SELECT Name
FROM sqltutorial.automotive
WHERE selling_price > (SELECT AVG(Selling_price) FROM sqltutorial.automotive)
	AND mileage < (SELECT AVG(mileage) FROM sqltutorial.automotive);
    
-- 5. Calculate the cumulative sum of the selling prices over the years for each car model.
SELECT Name, year, selling_price,
	SUM(selling_price) OVER (PARTITION BY Name ORDER BY Year) AS cumulative_sum
FROM sqltutorial.automotive;

-- 6. Identify the car models that have a selling price within 10% of the average selling price.
SELECT Name, selling_price
FROM sqltutorial.automotive
WHERE selling_price BETWEEN (SELECT AVG(selling_price) * 0.9 FROM sqltutorial.automotive) AND (SELECT AVG(Selling_price) * 1.1 FROM sqltutorial.automotive);

-- 7. Calculate the exponential moving average (EMA) of the selling prices for each car model, considering a smoothing factor of 0.2.
SELECT Name, year, selling_price,
	AVG(selling_price) OVER (PARTITION BY Name ORDER BY year ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS ema_selling_price
FROM sqltutorial.automotive;

-- 8. Identify the car models that have had a decrease in selling price from the previous year.
SELECT Name, year, selling_price
FROM (
	SELECT Name, year, selling_price,
		LAG(selling_price) OVER (PARTITION BY Name ORDER BY year) AS previous_year_price
	FROM sqltutorial.automotive
) AS price_changes
WHERE selling_price < previous_year_price;

-- 9. Retrieve the names of cars with the highest total mileage for each transmission type.
WITH TotalMileage AS(
	SELECT Name, transmission, SUM(km_driven) AS total_mileage
    FROM sqltutorial.automotive
    GROUP BY Name, Transmission
)
SELECT Name, transmission, total_mileage
FROM TotalMileage
WHERE (transmission, total_mileage) IN (
SELECT transmission, MAX(total_mileage)
FROM TotalMileage
GROUP BY transmission
);

-- 10. Find the average selling price per year for the top 3 car models with the highest overall selling prices.
WITH RankedSellingPrices AS (
	SELECT Name, selling_price,
    RANK() OVER (partition by Name order by selling_price DESC) AS price_rank
    FROM sqltutorial.automotive
)
SELECT Name, Year, AVG(selling_price) AS avg_selling_price_per_year
FROM sqltutorial.automotive
WHERE Name IN (
	SELECT Name
    FROM RankedSellingPrices
    WHERE price_rank <= 3
)
GROUP By Name, year;