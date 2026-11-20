-- Create schema named finance
CREATE SCHEMA IF NOT EXISTS finance;

-- Set schema as default
USE finance;

SELECT * FROM cc_data_dec19;
SELECT * FROM location_data;

-- 4.1 Total number of transactions
SELECT COUNT(*) AS total_transactions
FROM cc_data_dec19;

-- 4.2 Top 10 most frequent merchants
SELECT merchant, COUNT(*) AS transactions_count
FROM cc_data_dec19
GROUP BY merchant
ORDER BY transactions_count DESC
LIMIT 10;

-- 4.3 Average transaction amount for each category
SELECT category, ROUND(AVG(amt), 2) AS avg_transaction_amount
FROM cc_data_dec19
GROUP BY category
ORDER BY avg_transaction_amount DESC;

-- 4.4 Number of fraudulent transactions and their percentage of the total
SELECT
    SUM(is_fraud = 1) AS fraudulent_transactions,
    ROUND(SUM(is_fraud = 1) / COUNT(*) * 100, 2) AS percentage_of_total
FROM cc_data_dec19;

-- 4.5 Latitude and longitude of each transaction
SELECT cc.*, ld.lat, ld.`long`
FROM cc_data_dec19 cc
JOIN location_data ld
    ON cc.cc_num = ld.cc_num;   -- use trans_num if location_data is per transaction

-- 4.6 City with the highest population
SELECT city, city_pop AS highest_population
FROM location_data
ORDER BY city_pop DESC
LIMIT 1;

-- 4.7 Earliest and latest transaction dates
SELECT
    MIN(STR_TO_DATE(trans_date_trans_time, '%d-%m-%Y %H:%i')) AS earliest,
    MAX(STR_TO_DATE(trans_date_trans_time, '%d-%m-%Y %H:%i')) AS latest
FROM cc_data_dec19;
