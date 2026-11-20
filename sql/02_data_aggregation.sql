-- 5. Data aggregation
-- 5.1 Total amount spent
SELECT SUM(amt) AS total_amount_spent
FROM cc_data_dec19;

-- 5.2 Transactions in each category
SELECT category, COUNT(*) AS transactions_count
FROM cc_data_dec19
GROUP BY category;

-- 5.3 Average transaction amount by gender
SELECT gender, ROUND(AVG(amt), 2) AS avg_transaction_amount
FROM cc_data_dec19
GROUP BY gender;

-- 5.4 Day of the week with the highest average transaction amount
SELECT
    DAYNAME(STR_TO_DATE(trans_date_trans_time, '%d-%m-%Y %H:%i')) AS day_of_week,
    ROUND(AVG(amt), 2) AS avg_transaction_amount
FROM cc_data_dec19
GROUP BY day_of_week
ORDER BY avg_transaction_amount DESC
LIMIT 1;
