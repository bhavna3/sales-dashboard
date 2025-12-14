USE retail_sales;

-- Remove invalid or duplicate records
DELETE FROM retail_sales_data
WHERE transaction_id IS NULL OR total_amount <= 0;

-- Check for duplicates
SELECT transaction_id, COUNT(*) FROM retail_sales_data
GROUP BY transaction_id
HAVING COUNT(*) > 1;

-- Standardize category names
UPDATE retail_sales_data
SET product_category = TRIM(LOWER(product_category));

-- Create a cleaned view
CREATE OR REPLACE VIEW retail_sales_clean AS
SELECT
    transaction_id,
    DATE(date) AS order_date,
    customer_id,
    UPPER(gender) AS gender,
    age,
    INITCAP(product_category) AS product_category,
    quantity,
    price_per_unit,
    total_amount
FROM retail_sales_data;
