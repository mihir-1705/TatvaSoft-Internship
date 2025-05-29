create table students (
    fname varchar(100),
    lname varchar(100),
    rollno int,
    course varchar(50)
);

insert into students(fname, lname, rollno, course) values
('Nikhil', 'Shah', 5, 'Mech'),
('Tanvi', 'Patel', 9, 'Elec'),
('Soham', 'Trivedi', 12, 'Civil'),
('Komal', 'Rana', 17, 'Comp'),
('Aman', 'Joshi', 21, 'Elec'),
('Diya', 'Gandhi', 6, 'Mech'),
('Ravi', 'Singh', 28, 'Civil'),
('Mansi', 'Mehta', 33, 'Comp'),
('Yash', 'Thakkar', 41, 'Mech'),
('Reena', 'Desai', 14, 'Comp');

select fname, rollno from students;

select * from students;

alter table students add faculty varchar(100);

update students
set faculty = case
    when course in ('Mech', 'Elec') then 'Engg'
    when course in ('Comp', 'Civil') then 'Tech'
    else null
end;

delete from students where rollno = 14;

alter table students rename column course to dept;

select * from students where rollno = 9;
select * from students where rollno < 25;
select * from students where rollno > 25;
select * from students where rollno <= 25;
select * from students where rollno >= 25;
select * from students where rollno != 9;

select * from students where fname like 'S%';
select * from students where fname like 'So%';
select * from students where fname ilike 'soh%';

select * from students order by rollno desc;
select * from students limit 8;
select * from students offset 2 limit 5;

select count(*) from students;
select avg(rollno) from students;
select max(rollno), min(rollno) from students;

create table faculties (
    id serial primary key,
    name varchar(100) unique not null
);

insert into faculties(name) values
('Engg'),
('Tech');

alter table students add column fac_id int;

update students
set fac_id = case
    when faculty = 'Engg' then 1
    when faculty = 'Tech' then 2
end;

alter table students
add constraint fk_fac
foreign key (fac_id) references faculties(id);

select s.fname, s.rollno, f.name
from students s
inner join faculties f on s.fac_id = f.id;

select s.fname, f.name
from students s
left join faculties f on s.fac_id = f.id;

select s.fname, f.name
from students s
right join faculties f on s.fac_id = f.id;

select * from students where dept in ('Mech', 'Comp');
select * from students where dept not in ('Elec');

select * from students where rollno between 10 and 35;

select * from students where fname like 'R%';
select * from students where lname ilike '%mehta';

select * from students where faculty is null;
select * from students where faculty is not null;

select dept, count(*) from students group by dept;
select dept, count(*) from students group by dept having count(*) > 2;
