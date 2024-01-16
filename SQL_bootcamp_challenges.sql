SELECT table_schema, table_name,column_name,data_type, collation_name
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_schema = 'oes' AND TABLE_NAME='products'; 
-- this up here is how we proceed to have meta-data information about other data. it will only return collation_name for varchar columns.





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