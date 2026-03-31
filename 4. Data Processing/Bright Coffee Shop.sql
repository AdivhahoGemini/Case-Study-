--This will check if the table has been loaded correctly. 
SELECT *
FROM workspace.default.bright_coffee_shop_sales
LIMIT 1000;
--------------------------------------------------------
----------1.Date Range
--------------------------------------------------------
--When the data was collected (01/01/2023)
SELECT MIN (transaction_date) start_date
FROM workspace.default.bright_coffee_shop_sales;

--When the data was last collected (30/06/2023)
SELECT MAX (transaction_date) end_date
FROM workspace.default.bright_coffee_shop_sales;
-------------------------------------------------------
--2. Name of store Location (3 Stores)
-------------------------------------------------------
SELECT DISTINCT store_location
FROM workspace.default.bright_coffee_shop_sales;
-------------------------------------------------------
--3.Products sold in each store
-------------------------------------------------------
SELECT DISTINCT product_category
FROM workspace.default.bright_coffee_shop_sales;

SELECT DISTINCT product_detail
FROM workspace.default.bright_coffee_shop_sales;
--------------------------------------------------------
--4.Products sold in each store with category.
----------------------------------------------------------
SELECT DISTINCT product_category As Category,
product_detail AS product_name
FROM workspace.default.bright_coffee_shop_sales;
----------------------------------------------------------
--5.Product sold, catagory and type in each store.
----------------------------------------------------------
SELECT DISTINCT product_category As Category,
product_detail AS Product_Name,
product_type AS Product_Type
FROM workspace.default.bright_coffee_shop_sales;
---------------------------------------------------------
--6. Expensive and cheapest product
---------------------------------------------------------
SELECT MIN (unit_price) AS cheapest_product
FROM workspace.default.bright_coffee_shop_sales;

SELECT MAX (unit_price) AS expensive_product
FROM workspace.default.bright_coffee_shop_sales;

----------------------------------------------------------
--7. COUNT ROWS (transactions, products, stores)
----------------------------------------------------------
SELECT COUNT(*) AS number_of_rows,
COUNT (DISTINCT transaction_id) AS number_of_transactions,
COUNT (DISTINCT product_id) AS number_of_products,
COUNT (DISTINCT store_id) AS number_of_stores
FROM workspace.default.bright_coffee_shop_sales;
----------------------------------------------------------
--8. Date functions 
----------------------------------------------------------
SELECT transaction_id,
        dayname(transaction_date) AS Day_name
        month (transaction_date) AS Month_name
FROM workspace.default.bright_coffee_shop_sales;
---------------------------------------------------------
--9. Data aggregation 
---------------------------------------------------------
SELECT COUNT(*)
FROM workspace.default.bright_coffee_shop_sales;

------------------------------------------------------------------
--10. Data aggregation . revenue per day. number of sales per day
------------------------------------------------------------------
SELECT 
  transaction_date,
  dayname (transaction_date) AS Day_name,
  month (transaction_date) AS Month_name,
  COUNT (DISTINCT transaction_id) AS Number_of_sales,
  SUM(transaction_qty*unit_price) AS revenue_per_day
FROM workspace.default.bright_coffee_shop_sales
GROUP BY transaction_date, Day_name, Month_name
ORDER BY transaction_date,
        Day_name;
-----------------------------------------------------------
--11. Grouping by 30-minute time intervals 
-----------------------------------------------------------
SELECT transaction_time,
       minute(transaction_time) AS minute,
       floor(minute(transaction_time)/30) AS interval,
       COUNT(DISTINCT transaction_id) AS number_of_sales,
       SUM(transaction_qty*unit_price) AS revenue_per_interval
       FROM workspace.default.bright_coffee_shop_sales
       GROUP BY transaction_time, minute, interval
       ORDER BY transaction_time;
--------------------------------------------------------------
--12. Create a new column: “transaction_time_bucket” to group transactions into 30-minute intervals (Or it can be 3 hour intervals)
--Cast “unit_price” properly (some entries use commas, e.g., '3,1' should be converted
to 3.1)
--Compute “total_amount = unit_price * transaction_qty”
--------------------------------------------------------------
SELECT *,
-- 30-minute time bucket
CONCAT(DATE_FORMAT(transaction_time, 'HH:'), 
LPAD(FLOOR(MINUTE(transaction_time) / 30) * 30, 2, '0')) AS transaction_time_bucket,
-- Clean unit price
CAST(REPLACE(unit_price, ',', '.') AS DECIMAL(10,2)) AS unit_price_clean,
-- Total revenue per transaction
 CAST(REPLACE(unit_price, ',', '.') AS DECIMAL(10,2)) * transaction_qty AS total_amount
  FROM workspace.default.bright_coffee_shop_sales;

