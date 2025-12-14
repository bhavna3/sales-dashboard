SELECT 
    COUNT(DISTINCT transaction_id) AS total_transactions,
    SUM(total_amount) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS avg_transaction_value
FROM retail_sales_clean;

SELECT gender, 
       SUM(total_amount) AS total_revenue, 
       ROUND(AVG(total_amount),2) AS avg_order_value
FROM retail_sales_clean
GROUP BY gender;

SELECT 
  CASE 
    WHEN age < 20 THEN 'Under 20'
    WHEN age BETWEEN 20 AND 29 THEN '20s'
    WHEN age BETWEEN 30 AND 39 THEN '30s'
    WHEN age BETWEEN 40 AND 49 THEN '40s'
    ELSE '50+'
  END AS age_group,
  SUM(total_amount) AS revenue
FROM retail_sales_clean
GROUP BY age_group
ORDER BY revenue DESC;

SELECT product_category, 
       SUM(quantity) AS total_units_sold, 
       SUM(total_amount) AS revenue
FROM retail_sales_clean
GROUP BY product_category
ORDER BY revenue DESC
LIMIT 5;

SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS month, 
  SUM(total_amount) AS monthly_revenue
FROM retail_sales_clean
GROUP BY month
ORDER BY month;
