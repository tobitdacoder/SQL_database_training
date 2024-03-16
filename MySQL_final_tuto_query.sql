create table cats(
cat_id int auto_increment,
name varchar(100),
breed varchar(100),
age int,
CONSTRAINT pk_cats  primary key(cat_id)
);

drop table cats;

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
select cat_id from cats;

select name, breed
from cats;

select name, age 
from cats
where breed = 'tabby';

select cat_id, age
from cats
where cat_id=age;

update cats
set age=14
where name='misty';