-- CHALLENGE ONE

SELECT first_name,last_name
FROM hcm.employees;  -- this code here will select all the records in 
                     -- the column first_name and last_name

SELECT first_name,last_name, coalesce(state_province,'N/A') as 	State_province
FROM hcm.employees;