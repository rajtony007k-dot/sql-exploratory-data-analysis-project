-- Database exploration
-- Explore all objects in the database
SELECT * FROM INFORMATION_SCHEMA.TABLES

-- Explore all columns in the database
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers'


SELECT count(*), order_number FROM gold.fact_sales
group BY order_number
select * from gold.fact_sales