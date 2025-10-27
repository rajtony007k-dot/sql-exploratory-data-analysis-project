-- Dimensions exploration
-- Explore all countries our customers come from
SELECT DISTINCT country FROM gold.dim_customers

-- Explore all categories "The major divisions"
SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products
ORDER BY 1,2,3

-- Date exploration
-- Find the date of the first & last order
-- How many years of sales are available
SELECT 
MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date,
DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS order_range_months
FROM gold.fact_sales

-- Find youngest & oldest customer
SELECT
MIN(birthdate) AS oldest_birthdate,
DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_age,
MAX(birthdate) AS youngest_birthdate,
DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers
