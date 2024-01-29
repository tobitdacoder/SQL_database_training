use my_oracle;
CREATE TABLE Department (
    DeptNo int NOT NULL PRIMARY KEY,
    DName varchar(100),
    Loc varchar(100)
);


insert into Department (DeptNo,Dname,Loc) 
values (10,'SALES','KAMPALA'),
(40,'MARKETING','ENTEBBE'),
(30,'ACCOUNTING','MUKONO');

select *
from Department;




-- ==============================================================


create table Employee (
    EmpNo varchar(20) not null primary key,
    Ename varchar(60),
    Job varchar(30),
    Salary int,
    DeptNo int not null,
    foreign key(DeptNo) references Department(DeptNo) ON DELETE CASCADE 
);

-- Consider using cascade options if you want changes in the referenced table to propagate to the referencing table automatically.
-- For example, you can use ON DELETE CASCADE to delete related records in the referencing table when a referenced record is deleted.
-- in this query up here you can see how to define a foreign key in a table 
-- creation query

insert into Employee (EmpNo,Ename,Job,Salary,DeptNo) 
values ('E002','Agaba','Manager',16000,30),
('E004','Timo','Clerk',40000,30),
('E005','Simon','Manager',60000,40),
('E006','Mark','Manager',45000,10),
('E007','Solomon','Teacher',30000,30);

select *
from Employee;
