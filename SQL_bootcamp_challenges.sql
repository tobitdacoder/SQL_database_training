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


--LEFT OUTER JOIN:

SELECT d.dept_id, d.dept_name, e.emp_id, e.first_name
FROM departments d LEFT OUTER JOIN employees e
ON d.dept_id = e.dept_id;

-- Here we are using the LEFT OUTER JOIN keyword, and what this will do, is that it 
-- will return ALL ROWS from the left hand side table, even then ones which do not have
-- a match in the right table, will be preserved, BUT THE ONES IN THE RIGHT TABLE WHICH
-- DO NOT HAVE A MATCH IN THE LEFT TABLE WILL NOT BE RETURNED

-- NOTE: here the rows which do not have a match in the right table will be returned and
-- the part of the second table that is empty will be filled with NULL place holders.

-- Alsoif we want, in the query, we can place the table names in different lines, one above 
-- another and the result will be the same. 
-- LIKE THIS 👇🏽:

SELECT d.dept_id, d.dept_name, e.emp_id, e.first_name
FROM departments d 
LEFT OUTER JOIN employees e
ON d.dept_id = e.dept_id;


-- NOTE: the 'OUTER' word is optional, so you can either write LEFT OUTER JOIN or LEFT JOIN, like this:

SELECT d.dept_id, d.dept_name, e.emp_id, e.first_name
FROM departments d LEFT JOIN employees e  --[ here is where the renaming or the alias 'd' and 'e' are coming from, not in the select]
ON d.dept_id = e.dept_id;


-- RIGHT OUTER JOIN:

SELECT d.dept_id, d.dept_name, e.emp_id, e.first_name
FROM employees e RIGHT OUTER JOIN departments d
ON d.dept_id = e.dept_id;

-- Same logic as LEFT OUTER JOIN. Here the only difference is that all the rows in the table at the 
-- RIGHT will be returned even if they are not matching with any row in the table at the LEFT, 
-- the empty spaces will be filled with NULL.
-- --------------------------------------------------------------



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



-- CHALLENGE TWENTY-FIVE: (on logical operators):

SELECT *
FROM hcm.employees
WHERE (city= 'Seattle' OR city = 'Sydney') AND hire_date >= '20190101'
ORDER BY hire_date DESC;
-- here we are using the AND and the OR operatyors, but here we are using the precedence logic.

-- OR 

SELECT *
FROM hcm.employees
WHERE (city IN ('Sydney','Seattle')) AND hire_date >= '20190101'
ORDER BY hire_date DESC;


-- CHALLENGE TWENTY-SIX: (on logical operators):

SELECT *
FROM oes.products
WHERE category_id NOT IN (1,2,5);
-- here we are retrieving again informations using both the NOT and the IN operators. 


-- CHALLENGE TWENTY-SEVEN: (on joins)


SELECT e.employee_id, e.first_name, e.last_name,e.salary, d.department_name
FROM hcm.employees e INNER JOIN hcm.departments d 	
ON e.department_id = d.department_id;

-- here we are using an INNER JOIN and this will help us return ONLY the rows which matched in both tables.

-- CHALLENGE TWENTY-EIGHT: (on joins)

SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name
FROM hcm.employees e LEFT OUTER JOIN hcm.departments d
ON e.department_id = d.department_id;

-- here we are now using the LEFT OUTER JOIN which will later return all the linked rows,
-- but also the rows in the left table which did not match with an id in the second table.


-- CHALLENGE TWENTY-NINE: (on joins)

SELECT e.department_id, COUNT(e.employee_id),d.department_name 
FROM hcm.employees e LEFT OUTER JOIN hcm.departments d
ON e.department_id = d.department_id
GROUP BY e.department_id;

-- here is a new query where we are basically using the JOINS to return a specific number of data based on the JOINS that we made

-- CHALLENGE THIRTY: (on joins):

SELECT e.employee_id, e.first_name, e.last_name, e.manager_id, em.first_name AS manager_first_name, em.last_name AS manager_last_name 
FROM hcm.employees e LEFT OUTER JOIN hcm.employees em
ON e.manager_id = em.employee_id;
-- here we are using SELF-REFERENCING JOIN, by using the employee id as our new manager ID, we are basically returning the rows
-- where the manager id in the first table maches the employee id in the second, this to show us which employees are also managers. 


-- CHALLENGE THIRTY-ONE: (advanced join challenges)


SELECT p.product_id, p.product_name, w.warehouse_id, w.warehouse_name, inv.quantity_on_hand
FROM oes.products p INNER JOIN oes.inventories inv ON p.product_id = inv.product_id INNER JOIN oes.warehouses w ON inv.warehouse_id = w.warehouse_id
WHERE w.warehouse_name is not NULL;

/*
   We are basically linking three tables using the INNER JOIN. make sure to undrstand what is going on after the FROM clause.
*/

-- CHALLENGE THIRTY-TWO: (advanced join challenges)

SELECT e.employee_id,
 e.first_name,
 e.last_name,
 d.department_name,
 j.job_title,
 e.state_province,
 c.country_name
FROM hcm.employees e LEFT OUTER JOIN hcm.departments d ON e.department_id = d.department_id 
INNER JOIN hcm.jobs j ON e.job_id = j.job_id INNER JOIN hcm.countries c ON e.country_id = c.country_id
WHERE c.country_name='Australia';


-- CHALLENGE THIRTY-THREE: (advanced join challenges)


SELECT pc.category_name,p.product_name, SUM(oi.quantity) AS total_order_per_product
FROM oes.product_categories pc INNER JOIN oes.products p ON pc.category_id = p.category_id INNER JOIN oes.order_items oi ON p.product_id = oi.product_id
GROUP BY category_name,product_name
ORDER BY category_name,product_name;

-- here is one of the MOST difficult queries so far, so we are basically returning rows from different tables.
--  and using different joins (make sure that your INNER JOINS don't influence the OUTER JOIN, here we started by using the OUTER JOIN then INNER JOINS later).


-- CHALLENGE THIRTY-FOUR: (advanced join challenges)

SELECT pc.category_name,p.product_name, COALESCE(SUM(oi.quantity),0) AS total_order_per_product
FROM oes.product_categories pc INNER JOIN oes.products p ON pc.category_id = p.category_id LEFT OUTER JOIN oes.order_items oi ON p.product_id = oi.product_id
GROUP BY category_name,product_name
ORDER BY category_name,product_name;

-- here we are just making sure too return all the products, even the ones which are not sold yet,
-- and we use the COALESCE function to eliminate NULLs and replace them with ZERO


-- CHALLENGE THIRTY-FIVE: (advanced join challenges)

SELECT sighting_id, common_name, scientific_name, location_of_sighting, sighting_date
FROM bird.california_sightings
UNION ALL
SELECT sighting_id, common_name, scientific_name, sighting_location, sighting_date
FROM bird.arizona_sightings; -- this query will return an UNNITED table if the two linked tables
                             -- here we used the UNION ALL, which means that even the duplicates
                             -- combinations (equal rows) can be retrieved if they are there.


-- CHALLENGE THIRTY-SIX: (advanced join challenges)

SELECT sighting_id, common_name, scientific_name, location_of_sighting, sighting_date
FROM bird.california_sightings
UNION 
SELECT sighting_id, common_name, scientific_name, sighting_location, sighting_date
FROM bird.arizona_sightings;

-- CHALLENGE THIRTY-SEVEN: (advanced join challenges)

SELECT scientific_name, location_of_sighting AS state_name 
FROM bird.california_sightings
UNION
SELECT scientific_name, sighting_location AS state_name 
FROM bird.arizona_sightings
ORDER BY state_name,scientific_name; --> here we have added an ORDER BY clause to order the retrieved table.
                                     --> here we are now using the ORDER BY clause to retrieve the rows when
                                     --> they are already ordered. NOTICE that we have used two columns to order properly.


-- CHALLENGE THIRTY-EIGHT: (advanced join challenges)


SELECT sighting_id, common_name, scientific_name, location_of_sighting as state_name, sighting_date
FROM bird.california_sightings
UNION
SELECT sighting_id, common_name, scientific_name, sighting_location, sighting_date
FROM bird.arizona_sightings
UNION
SELECT observation_id, 'NULL' AS common_name, scientific_name, locality, sighting_datetime
FROM bird.florida_sightings; --> here we are basically unifying not two but THREEn tables, following the rules specified earlier. 

-- NOTE 

SELECT scientific_name, 'California' AS state_name 
FROM bird.california_sightings
UNION
SELECT scientific_name, 'Arizona' AS state_name
FROM bird.arizona_sightings
ORDER BY state_name,scientific_name;
--> THIS CAN BE USED WHEN WE WANT THE State_name for california_sightings to be california and 
--> same thing applied to arizona.


--==========================================================================================================





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

-- COMPOSITE JOIN: Joining on multiple columns

SELECT c.population, c.city, c.country, s.country, AS store_country, s.store_id, s.area_sqm
FROM cities c INNER JOIN stores s
ON c.city = s.city AND c.country = s.country;

-- here we are now introducing to composite joins.
-- This is when we re using multiple columns to get unique combinations
-- this is because there is not any column with unique values in the table.


-- JOIN MORE THAN TWO TABLES: 
-- Here we are going to join those three tables using this query there:

SELECT d.doc_id, d.doc_last_name, p.patient_id, p.last_name
FROM doctor d INNER JOIN doctor_patient dp ON d.doc_id = dp.doc_id INNER JOIN patients p ON dp.patient_id = p.patient_id;

/*
 What is happening here is that we are first joining the first two tables using the doc_id PK
Then, a new table will be created, then we automatically join that new table with the patient
table using an inner join on dp.patient_id = p.patient_id
this is for a many to many relationship.
*/


-- now let us join the three tables while we have added a new doctor in the doctor table:
-- Note that this doctor has not patient assigned to him:

SELECT d.doc_id, d.doc_last_name, p.patient_id, p.last_name
FROM doctor d 
LEFT OUTER JOIN doctor_patient dp 
ON d.doc_id = dp.doc_id 
LEFT OUTER JOIN patients p 
ON dp.patient_id = p.patient_id;

/*
here is how we do, we add two LEFT OUTER JOIN to retrieve
 all the rows in the doctor table, even the ones which 
 does not satisfy the condition.
*/

-- NOW LET US INTRODUCE THE SELF-REFERENCING JOIN:

SELECT e.employee_id, e.first_name, e.job_title, e2.first_name AS manager_name, e2.job_title AS manager_name
FROM employees e INNER JOIN employees e2
ON e.manager_id = e2.employee_id;

-- here, since in our table we had the managers as employees too, we used self referencing by duplicating the table, and then join the 
-- two identic tables, joining them where the employee_id in the first table  is equal to the managers_id in the second table, what this will do
-- is that it will return a joined table where each employee have his managers name and job title.

-- HERE IS HOW WE CAN DO IT, USING THE LEFT OUTER JOIN IN ORDER TO SHOW THAT THE CEO Judy DOES NOT HAVE A MANAGER.

SELECT e.employee_id, e.first_name, e.job_title, e2.first_name AS manager_name, e2.job_title AS manager_name
FROM employees e LEFT OUTER JOIN employees e2
ON e.manager_id = e2.employee_id;
-- here we are now using the LEFT OUTER JOIN to return even the rows in the left table that does noot have maching employee_id in the second table.

-- CROS JOIN:

-- Note that these two tables have no links between them. There is not any column or set of columns that we can join these two on. 
-- But we can still do a CROSS JOIN into these two tables.

SELECT s.store_id, s.store_location, p.product_id, p.product_name
FROM stores s CROSS JOIN products p;

-- TO GET ALL THE META DATA ABOUT ANY TABLE, YOU JUST DO LIKE THIS:

-- describe table_name;  eg:
describe bird.arizona_sightings; 
--> Here we have just seen how we can retrieve all the meta data about any table in case we want to use them for a specific purpose.

-- UNION and UNION ALL set operators

 --to UNION these two tables which have the same number of
 -- columns and same types of columns BUT from different tables, we do this

SELECT first_name, last_name, email
FROM customers
UNION
SELECT first_name, last_name, email_adress
FROM canadian_subscribers;

-- we can also order by the result:

SELECT first_name, last_name, email
FROM customers
UNION
SELECT first_name, last_name, email_adress
FROM canadian_subscribers
ORDER BY email;   --[we are using the column names of the first table coz they dominate]


-- SELF-CONTAINED SUBQUERIES:

SELECT product_id, category, price 
FROM products
WHERE price = (SELECT MAX(price)
               FROM products);
-- this is how we use a self contained subquery.


SELECT product_id, category, price
FROM products
WHERE product_id IN (SELECT product_id
                     FROM order_details);
-- and this is how we can return many rows, using the IN clause.

-- CORRELATED SUBQUERIES:

SELECT product_id, category, price
FROM product p1
WHERE price = (SELECT MAX(price)
     FROM product p2
     WHERE p2.category = p1.category);
