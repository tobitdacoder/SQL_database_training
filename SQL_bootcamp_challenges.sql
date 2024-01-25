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

-- TO CHECK THE DATATYPES AND THE META DATA OF THE DATA, PROCEED BY USING THIS QUERY

-- SELECT table_schema,table_name,column_name,data_type,collation_name
-- FROM INFORMATION_SCHEMA.COLUMNS
-- WHERE table_schema='oes' AND TABLE_NAME='countries'; 

-- AND operator:

SELECT *
FROM hotel_rooms
WHERE Room_Style='Single' AND  Window_View='Ocean'
COLLATE utf8mb4_0900_ai_ci;
-- here we are basically using the AND operator and here the rows 
-- that will be returned are the ones which fulfill, at the same time, 
-- the conditions imposed by the AND operator.

-- OR operator:

SELECT *
FROM hotel_rooms
WHERE Room_Style='Single' OR  Window_View='Ocean'
COLLATE utf8mb4_0900_ai_ci;

-- Here we are basically using the OR operator and here the rows that 
-- will be returned are the ones which fulfill one of the conditions
 -- imposed by the 0R operator. If one of them is TRUE or both are TRUE, 
 -- then the final answer is TRUE and they will be returned.


-- THE IN OPERATOR INTRO

--SELECT  *
--FROM table1
--WHERE column1 IN (value1, value2, value3, …); 

-- here we want to return all the column, with all the rows,
-- from the table1, where the values in column1 are in this given 
-- set inside the parentheses


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

-- CHALLENGE SEVEN

SELECT first_name,last_name,employee_id
FROM hcm.employees
ORDER BY last_name ASC; -- this will order in ASCENDING order of alphabet letters.

-- CHALLENGE HEIGHT

SELECT first_name,last_name,employee_id,salary
FROM hcm.employees
ORDER BY salary DESC;	-- FROM higher salary to lower one. here you can see that we specified DESC.	

-- CHALLENGE NINE

SELECT first_name,last_name,employee_id,hire_date
FROM hcm.employees
ORDER BY hire_date DESC, employee_id ASC;
-- here we are now ordering using two column, so that we can do a two level ordering.

-- CHALLENGE TEN

SELECT *
FROM hcm.employees
ORDER BY salary DESC
LIMIT 10; -- only 10 records will be returned since we specified the limit. that is by using the LIMIT clause.

-- CHALLENGE ELEVEN

SELECT *
FROM oes.products
WHERE list_price > 100; -- this where here comes in to FILTER the data before to return it. Using the WHERE clause.

SELECT *
FROM oes.products
WHERE list_price >= 100
ORDER BY list_price DESC; -- here we are just justifying the order in which the result will be retrieved.

-- CHALLENGE TWELVE

SELECT *
FROM oes.orders
WHERE shipped_date IS NULL; -- here we are simply returning all the orders which are not yet shipped (where the shipped date is unknown)


-- CHALLENGE THIRTEEN

SELECT *
FROM oes.orders
WHERE order_date = "20200226"; -- [This is 2020-02-26]
-- here we are basically filtering. only return the rows having date qual to 20200226.


-- CHALLENGE FOURTEEN

SELECT *
FROM oes.orders
WHERE order_date >= "20200101";
-- LATER DATES ARE GREATER DATES, Here we are seeing how to use the WHERE clause to filter the rows.

SELECT *
FROM products
WHERE product_name = 'usb hub';
-- same thing here we are filtering the rows.


-- CHALLENGE FIFTEEN:


SELECT *
FROM hcm.countries
WHERE country_name LIKE 'N%';
-- This will return all the country_names which start with N.


-- CHALLENGE SIXTEEN:

SELECT *
FROM oes.customers
WHERE email LIKE '%@gmail.com';
-- here by writing this, we are telling the query to return rows with a record that ends with @gmail.com


-- CHALLENGE SEVENTEEN:

SELECT department_id, COUNT(*) AS employee_number_per_dep
FROM hcm.employees
GROUP BY department_id;
-- here we are asked to return the number of employees per department.


-- CHALLENGE EIGHTEEN:

SELECT department_id, AVG(salary) AS average_salary
FROM hcm.employees
GROUP BY department_id
ORDER BY average_salary DESC;

-- here we are asked to return the average salary per department, from highest to lowest.

-- we can also use the AVG aggregate function inside the ORDER BY clause.Like this:

SELECT department_id, AVG(salary) AS average_salary
FROM hcm.employees
GROUP BY department_id
ORDER BY AVG(salary) DESC;

-- we can also ROUBD the salary by using the ROUND function and specifying the round level

SELECT department_id, ROUND(AVG(salary),1) AS average_salary
FROM hcm.employees
GROUP BY department_id
ORDER BY average_salary DESC;


-- CHALLENGE NINETEEN:

SELECT warehouse_id, SUM(quantity_on_hand) AS total_number_of_products
FROM oes.inventories
GROUP BY warehouse_id
HAVING total_number_of_products > 5000;

-- basically, here we are asked to return the total number of the product in hand in each warehouse
-- Here we are not focusing on the different types of products (we just want to know how many products,
-- all types combined, that are in each warehouse, grouping, based on the product_id).


-- CHALLENGE TWENTY:

SELECT locality, MAX(date_of_count) AS latest_date_of_count
FROM bird.antarctic_populations
GROUP BY locality;
-- here we are basically returning the latest date at which the species count have been made in each locality.


-- CHALLENGE TWENTY-ONE:

SELECT locality, species_id, MAX(date_of_count) AS latest_date_of_count
FROM bird.antarctic_populations
GROUP BY locality, species_id;
-- Now we are returning the latest count done for each species at each locality (here we are grouping by combining two columns)


-- CHALLENGE TWENTY-TWO: (on logical operators)

SELECT *
FROM hcm.employees
WHERE city = 'Seattle' OR city= 'Sydney';

-- Here we are now using the OR operator.


-- CHALLENGE TWENTY-THREE: (on logical operators)

SELECT *
FROM hcm.employees
WHERE city IN ('Seattle','Sydney','Ascot','Hillston');

-- here we are now using the IN operator to filter specific rows based on a set


-- CHALLENGE TWENTY-FOUR: (on logical operators):

SELECT *
FROM hcm.employees
WHERE city = 'Sydney' AND salary > 200000;
-- here we are filtering again using the AND operator;


-- EXERCICE on the Logical query Processing Order:

-- Write a query that returns the average price for product categories that have an average price greater
-- than $20. Exclude any products which have a category of “unassigned”. Order the query result by average.

SELECT category, AVG(price) AS average_price
FROM products
WHERE category != “unassigned”
GROUP BY category
HAVING AVG(price)>20;

--  Task: return the owner count for the properties which have more than one owner:

SELECT property_id,COUNT(*) AS owner_count
FROM properties
GROUP BY property_id
HAVING COUNT(*)  > 1;

-- We can also group by multiple columns

SELECT prop_zone,occupied, SUM(area_sqm) AS total_area_sqm
FROM properties
GROUP BY prop_zone,occupied;

-- [this will return the count of the different combinations;
-- so this GROUP BY helps us grouping based on a column or combination 
-- of two or more columns], the AGGREGATE FUNCTION ignores all the NULL 
-- values(does not consider them).


-- Let us do the count of properties by the occupied column 
-- (in other words, we will group by occupied column

SELECT occupied, COUNT(*) AS number_of_properties
FROM properties
GROUP BY occupied;

-- here we are returning the number of properties that are occupied, 
-- and the number of them which are not occupied