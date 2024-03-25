create database book_shop;
use book_shop;

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
    
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

select * from books;

SELECT CONCAT_WS(author_fname,' ', author_lname) AS author_full_name
FROM books;

SELECT CONCAT_WS(' ',author_fname, author_lname) AS author_full_name
FROM books;
-- in that separator we can add in any character that will be used as the separator. 


SELECT SUBSTRING(title, 1,15) 
FROM books; -- just a weird example but this is how it works

-- OR  

SELECT SUBSTR(title, 1,15) 
FROM books;

SELECT CONCAT(SUBSTR(title, 1,10), '...') AS short_title
FROM books;

SELECT REPLACE('i am tobit', 'tobit', 'mr tobit');
-- [this is how we use the REPLACE() function, we provide the string, 
-- then we precise what character or set of character that we want to replace,
-- then we provide the new value we want to use on the place of the old one].

SELECT REPLACE(title, ' ', '_') AS linked_titles
FROM books;
-- [this is how we replace the empty spaces between the words and use a specific character]

-- NOTE that REPLACE() can be used with the previous string functions we've just seen before.

SELECT REVERSE(TITLE) AS REVERSES
FROM BOOKS;


SELECT char_length(title) AS title_length, title
from books;
-- [this returns the number of characters in the provided string]

SELECT Upper(title) AS Upper_case_title
FROM books;
-- [this simply returns the provided string in UPPER case.]

-- OR

SELECT UCASE(title) AS Upper_case_title
FROM books;
-- [this simply returns the provided string in UPPER case.]

SELECT Lower(title) AS Upper_case_title
FROM books;
-- [this simply returns the provided string in UPPER case.]

-- OR

SELECT LCASE(title) AS Upper_case_title
FROM books;

SELECT CONCAT_WS(' ',lower('I LOVE'),upper(title),'!!!') AS final
from books;

SELECT INSERT('HELLO TOBY', 7,0, 'dear ') AS updatee;

select utc_timestamp() as utc_timee;
select dayname(now());

CREATE TABLE captions(
	Text varchar(150),
	Created_at timestamp default CURRENT_TIMESTAMP
);

# or 

CREATE TABLE captions(
	Text varchar(150),
	Created_at timestamp default CURRENT_TIMESTAMP()
);

# or 

CREATE TABLE captions(
	Text varchar(150),
	Created_at timestamp default now()
);

drop table captions;

insert into captions(text)
values('this is a new day to start AFRESH!');

select * from captions;

CREATE TABLE my_triggers.captions2(
	Text varchar(150),
	Created_at timestamp default CURRENT_TIMESTAMP,
	Updated_at timestamp on update CURRENT_TIMESTAMP
);



select dayname(curdate());
select dayofweek(curdate());

# or

select dayname(now());
select dayofweek(now());

select concat_ws(' / ',date_format(curdate(),'%b'),
				date_format(curdate(),'%a'),year(now())) 
                as formated_date; 
       
# or

select date_format(curdate(),'%m/%d/%Y'); 
#  						>> 03/12/2024

select concat_ws(' ',monthname(curdate()), date_format(curdate(),'%D'),
'at', hour(curtime()),':',minute(curtime())) as todays_date;

# or 

select date_format(now(), '%M %D at %k:%i');

insert into captions2(text)
values('Life is beautiful !');


update captions2
set text='I really love my life'
where text like '%beautiful%';

select * from captions2;

create table inventory(
	item_name varchar(40),
    price decimal(8,2),
    quantity int
);

create table tweets(
	tweet_content varchar(180),
    username varchar(50),
    created_at timestamp default current_timestamp
);


SELECT title
FROM book_shop.books
WHERE author_lname= 'Eggers' && released_year > 2010;

# or

SELECT title
FROM book_shop.books
WHERE author_lname= 'Eggers' AND released_year > 2010;


SELECT title
FROM book_shop.books
WHERE author_lname= 'Eggers' AND released_year > 2010 && title LIKE '%novel%';

SELECT title, released_year 
FROM book_shop.books
WHERE released_year >= 2004 AND released_year <=2015;

SELECT *
FROM book_shop.people
WHERE YEAR(birthdate) < 2005;

SELECT *
FROM book_shop.people
WHERE YEAR(birthdate) > 2005;



SELECT title, author_lname, released_year,
CASE
	WHEN released_year >=2000 THEN 'modern literature'
	ELSE '20th century literature' 
	END 
AS Genre
FROM book_shop.books;


select title, stock_quantity, 
case
	when stock_quantity between 0 and 40 then '*'
    when stock_quantity between 41 and 70 then '**'
    when stock_quantity between 71 and 100 then '***'
    when stock_quantity between 101 and 140 then '****'
    else '*****'
    end as stock_rating
from book_shop.books;
# this evaluates each row at a time and look for the case that suits that row. 


SELECT 10!= 10; #FALSE ...  0
SELECT 15>14 AND 99-5 <= 94; # TRUE ... 1
SELECT 1 IN (5,3) OR 9 BETWEEN 8 AND 10; #TRUE ... 1 

SELECT title, author_lname, released_year
from book_shop.books
where released_year < 1980;

SELECT title, author_lname, released_year
from book_shop.books
where author_lname IN ('eggers','chabon');

SELECT title, author_lname, released_year
from book_shop.books
where author_lname='lahiri' and released_year>2000;

SELECT title, author_lname, released_year, pages
from book_shop.books
where pages between 100 and 200;

SELECT title, author_lname, released_year
from book_shop.books
where left(author_lname,1) in ('c','s');

# or 

SELECT title, author_lname, released_year
from book_shop.books
where author_lname like 'C%' or author_lname like 'S%';

# or

SELECT title, author_lname, released_year
from book_shop.books
where SUBSTRING(author_lname, 1,1) IN ('C','S');

select title, author_lname, 
case
	when title like '%stories%' then 'Short stories'
    when title like '%just kids%' or title like '%a heartbreaking work%' then 'Memoir'
    else 'Novel'
    end as type
from book_shop.books; 


select author_fname, author_lname, 
case 
	when count(*) = 1 then concat_ws(' ',count(*), 'book')
    when count(*) > 1 then concat_ws(' ',count(*), 'books')
end as book_count
from book_shop.books
group by author_fname, author_lname; 


-- ===================================================================================

CREATE TABLE contacts (
	name varchar(100) not null,
    phone_num varchar(20) not null unique
);

insert into contacts(name, phone_num)
values('toto baba','+256991233818');
