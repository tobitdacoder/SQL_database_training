create database final;

-- use final;  this code is used to help us not always specify the db in the code we are writing
-- since we are already usingthe database (we are in the database)

select database();

create table pastries (
name varchar(50),
quantity int
);

desc pastries;