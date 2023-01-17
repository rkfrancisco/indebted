-- CREATE TABLE communication (
-- message_id VARCHAR(40),
-- customer_id VARCHAR(40),
-- sent_at TIMESTAMP,
-- clicked INT,
-- converted INT,
-- client_id VARCHAR(40),
-- gender VARCHAR(5),
-- customer_country TEXT,
-- age INT,
-- created_at TIMESTAMP,
-- client_name TEXT,
-- product_type TEXT,
-- client_country TEXT,
-- channel TEXT,
-- message_number INT
-- )
-- 1. How should we handle the missing values for the columns age and customer_country?
-- Deletion or Imputation
-- 2. What time of the day should we send our messages in each country?
-- 3. What should be the preferred channel to use when communicating with customers?
-- 4. What are the main metrics, dimensions and filters to be included in the dashboard?
-- 5. What is the communications performance over time? What could be causing this
-- behaviour?


SELECT * FROM COMMUNICATION;

-- Check the range of days the sms/email is sent (Monday to Friday)
SELECT DISTINCT to_char(sent_at,'Day') FROM COMMUNICATION;

-- Check the range of hours the sms/email is sent (8:00 to 19:00)
SELECT DISTINCT to_char(sent_at,'HH24') 
FROM COMMUNICATION
ORDER BY to_char(sent_at,'HH24') ASC;

-- 9751 Customers
SELECT COUNT(DISTINCT customer_id) FROM COMMUNICATION;

-- 2945 customers have missing age or country
SELECT count(DISTINCT customer_id) from COMMUNICATION where age is NULL or customer_country is NULL;

-- 3142 Converted Customers
SELECT count(DISTINCT customer_id) FROM COMMUNICATION
where converted=1;





