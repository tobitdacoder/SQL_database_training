SELECT table_schema, table_name,column_name,data_type, collation_name
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_schema = 'oes' AND TABLE_NAME='products'; 
-- this up here is how we proceed to have meta-data information about other data. it will only return collation_name for varchar columns.


SELECT product_id,product_name
FROM products
WHERE product_name='USB hub'
COLLATE utf8mb4_0900_as_cs; 
-- this up here will return the rows matching the condition considering the case sensitive collation



SELECT product_id, product_name
FROM products
WHERE product_name LIKE '%tablet%';  

-- [here, we are returning all the string sets containing the word tablet in them]
-- [the % sign is a wildcard which represents zero or more characters]


-- NOW WE ARE LEARNING HOW TO USE THE DIFFERENT AGGREGATE FUNCTIONS WITHIN MySQL

SELECT 
   MIN(prop_price) AS minimum_prop_price
FROM properties; 
-- this 👆🏽 will return the MINIMUM or smallest numerical number in the prop_price column, in other word the MINIMUM price property





-- ------------------------------------------------------------ --



-- CHALLENGE ONE

SELECT first_name,last_name
FROM hcm.employees;  -- this code here will select all the records in 
                     -- the column first_name and last_name

SELECT first_name,last_name, coalesce(state_province,'N/A') as 	State_province
FROM hcm.employees;

-- CHALLENGE TWO

SELECT last_name AS customer_last_name,city
FROM hcm.employees;

-- here e are using the AS keyword to return a renamed field.

-- CHALLENGE THREE

SELECT *
FROM oes.order_items;
-- this * specifies that we want to return all the columns in the table

-- CHALLENGE FOUR

SELECT DISTINCT locality
FROM bird.antarctic_populations;
-- this will basically return all the localities (distinct localities), and that is done by using the DISTINCT clause.

-- CHALLENGE SIX

SELECT employee_id,first_name,hire_date
FROM hcm.employees
ORDER BY hire_date DESC; -- this will make sure to order from the most rescent hired employee to the less recent one.
						 -- here, later dates are greater dates.





















