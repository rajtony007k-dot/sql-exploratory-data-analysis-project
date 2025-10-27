-- Measures exploration
-- Find the total sales
SELECT SUM(sales_amount) AS total_sales FROM gold.fact_sales;

-- Find how many items are sold
SELECT COUNT(quantity) AS total_quantity FROM gold.fact_sales;

-- Find the average selling price
SELECT AVG(price) AS avg_price FROM gold.fact_sales;

-- Find the total number of orders
SELECT COUNT(DISTINCT order_number) AS total_orders FROM gold.fact_sales;

-- Find the total number of products
SELECT COUNT(product_key) AS total_products FROM gold.dim_products;

-- Find the total number of customers
SELECT COUNT(customer_key) AS total_customers FROM gold.dim_customers;

-- Find the total number of customers that has placed an order
SELECT COUNT(DISTINCT customer_key) AS customers_placed_orders FROM gold.fact_sales

SELECT * FROM gold.fact_sales WHERE order_number = 'n/a'

-- Generate a report that shows all key metrics of the business

SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS total_sales FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', COUNT(quantity) AS total_quantity FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) AS avg_price FROM gold.fact_sales
UNION ALL
SELECT 'Total no. of orders', COUNT(DISTINCT order_number) AS total_orders FROM gold.fact_sales
UNION ALL
SELECT 'Total no. of products', COUNT(product_key) AS total_products FROM gold.dim_products
UNION ALL
SELECT 'Total no. of customers', COUNT(customer_key) AS total_customers FROM gold.dim_customers

