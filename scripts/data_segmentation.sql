-- Data Segmentation
-- Segment products into cost ranges and count how many products fall into each segment

WITH product_segments AS(
SELECT 
product_key,
product_name,
product_cost,
CASE WHEN product_cost < 100 THEN 'Below 100'
	 WHEN product_cost BETWEEN 100 AND 500 THEN '100-500'
	 WHEN product_cost BETWEEN 500 AND 1000 THEN '500-1000'
	 ELSE 'Above 1000'
END AS cost_range
FROM gold.dim_products)

SELECT
cost_range,
COUNT(product_key) total_products
FROM product_segments
GROUP BY cost_range
ORDER BY total_products DESC

/*Group customers into three segments based on their spending behaviour:
	- VIP: Customers with atleast 12 months of history and spending more than 5000.
	- Regular: Customers with atleast 12 months of history but spending less than 5000.
	- New: Customers with a lifespan of less than 12 months.
And find the total number of customers by each group
*/

WITH customer_spending AS (
SELECT 
c.customer_key,
SUM(f.sales_amount) AS total_spending,
MIN(order_date) AS first_order,
MAX(order_date) AS last_order,
DATEDIFF(month, MIN(order_date), MAX(order_date)) AS lifespan
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
GROUP BY c.customer_key)

SELECT 
customer_segment,
COUNT(customer_key) AS total_customers
FROM (
	SELECT 
	CASE WHEN lifespan >= 12 AND total_spending > 5000 THEN 'VIP'
		 WHEN lifespan >= 12 AND total_spending <= 5000 THEN 'Regular'
		 ELSE 'New'
	END AS customer_segment,
	customer_key
	FROM customer_spending) t
GROUP BY customer_segment
ORDER BY total_customers DESC;
