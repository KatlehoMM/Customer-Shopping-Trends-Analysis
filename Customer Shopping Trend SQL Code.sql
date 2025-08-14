SELECT * FROM SHOPPING_TRENDS.TRANSACTIONS.SHOPPING_SALES;
---------------
SELECT DISTINCT item_purchased
FROM SHOPPING_TRENDS.TRANSACTIONS.SHOPPING_SALES;
----------------
SELECT MAX(age)
FROM SHOPPING_TRENDS.TRANSACTIONS.SHOPPING_SALES;
SELECT MIN(age)
FROM SHOPPING_TRENDS.TRANSACTIONS.SHOPPING_SALES;
-----------------------
CASE
WHEN age BETWEEN 18 AND 30 THEN 'Youth'
WHEN age BETWEEN 31 AND 40 THEN 'Adult'
WHEN age BETWEEN 41 AND 50 THEN 'Senior'
ELSE 'Elder'
END AS age_buckets
----------------------------------------------------------------
-----
SELECT MAX("Purchase Amount (USD)")
FROM SHOPPING_TRENDS.TRANSACTIONS.SHOPPING_SALES;
SELECT MIN("Purchase Amount (USD)")
FROM SHOPPING_TRENDS.TRANSACTIONS.SHOPPING_SALES;
CASE
WHEN "Purchase Amount (USD)" BETWEEN 20 AND 30 THEN '01. 20-
30: Low Spend'
WHEN "Purchase Amount (USD)" BETWEEN 31 AND 50 THEN '02. 31-
50: Medium Spend'
WHEN "Purchase Amount (USD)" BETWEEN 51 AND 70 THEN '03. 51-
70: HighSpend'
ELSE '04. 70+ Very High spend'
END AS spend_buckets
----------------------------------------------------------------
-------
SELECT MIN(review_rating)
FROM SHOPPING_TRENDS.TRANSACTIONS.SHOPPING_SALES;
SELECT MAX(review_rating)
FROM SHOPPING_TRENDS.TRANSACTIONS.SHOPPING_SALES;
SELECT DISTINCT review_rating
FROM SHOPPING_TRENDS.TRANSACTIONS.SHOPPING_SALES;
CASE
WHEN review_rating <= 3.0 THEN 'Bad'
WHEN review_rating >= 3.1 AND review_rating <=4.0 THEN
'Neutral'
ELSE 'Good'
END AS review_rating_bucket;
----------------------------------------------------------------
-------Final query
SELECT
--- Dates
TO_DATE(processdate) AS purchase_date,
DAYNAME(TO_DATE(processdate)) AS day_name,
MONTHNAME(TO_DATE(processdate)) AS month_name,
TO_CHAR(TO_DATE(processdate), 'YYYY-MM') AS month_id,
DAYOFMONTH(TO_DATE(processdate)) AS day_of_month,
YEAR(TO_DATE(processdate)) AS year,
---Aggregation
SUM("Purchase Amount (USD)") AS revenue,
COUNT(DISTINCT customer_id) AS Number_of_customers,
SUBSCRIPTION_STATUS,
SHIPPING_TYPE,
DISCOUNT_APPLIED,
PROMO_CODE_USED,
PAYMENT_METHOD,
FREQUENCY_OF_PURCHASES,
CASE
WHEN review_rating <= 3.0 THEN 'Bad'
WHEN review_rating >= 3.1 AND review_rating <=4.0
THEN 'Neutral'
ELSE 'Good'
END AS review_rating_bucket,
CASE
WHEN "Purchase Amount (USD)" BETWEEN 20 AND 30 THEN
'01. 20-30: Low Spend'
WHEN "Purchase Amount (USD)" BETWEEN 31 AND 50 THEN
'02. 31-50: Medium Spend'
WHEN "Purchase Amount (USD)" BETWEEN 51 AND 70 THEN
'03. 51-70: HighSpend'
ELSE '04. 70+ Very High spend'
END AS spend_buckets,
CASE
WHEN age BETWEEN 18 AND 30 THEN 'Youth'
WHEN age BETWEEN 31 AND 40 THEN 'Adult'
WHEN age BETWEEN 41 AND 50 THEN 'Senior'
ELSE 'Elder'
END AS age_buckets
FROM SHOPPING_TRENDS.TRANSACTIONS.SHOPPING_SALES
GROUP BY ALL;
