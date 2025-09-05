CREATE TABLE retail_sales
(
		transactions_id INT PRIMARY KEY,
		sale_date DATE,
		sale_time TIME,
		customer_id INT,
		gender VARCHAR(10),
		age INT,
		category VARCHAR(35),
		quantiy INT ,
		price_per_unit FLOAT,
		cogs FLOAT,
		total_sale FLOAT
);

SELECT COUNT(*)
FROM retail_sales

-- Null Value Check: Check for any null values in the dataset and delete records with missing da

SELECT * FROM retail_sales
WHERE TRANSACTIONS_ID IS NULL

SELECT * FROM retail_sales
WHERE SALE_TIME IS NULL

SELECT * FROM retail_sales
WHERE 
	TRANSACTIONS_ID IS NULL
	OR 
	SALE_DATE IS NULL
	OR 
	SALE_TIME IS NULL
	OR 
	GENDER IS NULL
	OR
	CATEGORY IS NULL
	OR 
	QUANTITY IS NULL
	OR 
	COGS IS NULL
	OR 
	TOTAL_SALE IS NULL

DELETE FROM retail_sales
WHERE 
TRANSACTIONS_ID IS NULL
	OR 
	SALE_DATE IS NULL
	OR 
	SALE_TIME IS NULL
	OR 
	GENDER IS NULL
	OR
	CATEGORY IS NULL
	OR 
	QUANTITY IS NULL
	OR 
	COGS IS NULL
	OR 
	TOTAL_SALE IS NULL

-- DATA EXPLORATION
-- HOW MANY SALES WE HAVE 
 select count(*) as total_sale from retail_sales

-- HOW MANY CUSTOMERS WE HAVE ?
SELECT COUNT(DISTINCT CUSTOMER_ID) FROM retail_sales

-- DATA ANALYSIS & BISINESS KEY PROBLEM & ANSWERS

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT * FROM retail_sales
WHERE SALE_DATE = '2022-11-05'

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022

SELECT *
FROM RETAIL_SALES
WHERE CATEGORY = 'Clothing' 
  AND TO_CHAR(SALE_DATE, 'Mon-YYYY') = 'Nov-2022'


-- THIS IS MY METHOD
SELECT 
	*
	FROM RETAIL_SALES
WHERE CATEGORY = 'Clothing' AND SALE_DATE BETWEEN '1-11-2022' AND '30-11-2022'
GROUP BY 1

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT CATEGORY,
SUM(TOTAL_SALE) AS NET_SALE,
COUNT(*) AS TOTAL_ORDERS
FROM RETAIL_SALES
GROUP BY 1


-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT ROUND(AVG(AGE),2)
FROM RETAIL_SALES
WHERE CATEGORY = 'Beauty'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT * FROM RETAIL_SALES
WHERE TOTAL_SALE > 1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT CATEGORY,
		GENDER,
		COUNT(*) AS TOTAL_TRAN
FROM retail_sales
GROUP BY CATEGORY, GENDER
ORDER BY 1
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

select * from 
(
	SELECT
		EXTRACT(YEAR FROM SALE_DATE)AS YEAR,
		EXTRACT(MONTH FROM SALE_DATE) AS MONTH,
		AVG(TOTAL_SALE) AS AVG_SALE,
		RANK() OVER(PARTITION BY EXTRACT(YEAR FROM SALE_DATE) ORDER BY AVG(TOTAL_SALE) DESC) as rank
	FROM retail_sales
	GROUP BY 1,2
) as t1
where rank = 1


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
select customer_id,
		sum(total_sale) as total_sale
from retail_sales
group by 1
order by 2 DESC
limit 5

SELECT * from retail_sales

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select category, count(distinct customer_id)
from retail_sales
group by 1

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

WITH HOURLY_SALE
AS 
(
select *,
	case 
		when extract(Hour from sale_time) < 12 then 'morning'
		when extract(hour from sale_time) BETWEEN 12 AND 17 THEN 'AFTERNOON'
		else 'EVENING'
	end as shift 
from retail_sales
 )
SELECT SHIFT, COUNT (*) AS TOTAL_ORDERS 
FROM HOURLY_SALE
GROUP BY SHIFT

SELECT * FROM retail_sales

ALTER TABLE retail_sales
RENAME COLUMN QUANTIY TO QUANTITY