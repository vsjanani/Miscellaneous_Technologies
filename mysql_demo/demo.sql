create database qadbt;
use qadbt;
create table seleniumDemo(name varchar(25), id int, location varchar(20), age int);
use sakila;
describe actor;
select * from fav;
use qadbt;
show tables;
describe SeleniumDemo;
insert into SeleniumDemo values("janani", 1, "spokane", 32);
insert into SeleniumDemo values("darshini", 2, "ambattur", 7);
insert into SeleniumDemo values("krishna", 3, "kkpm", 4);
insert into SeleniumDemo values("dinesh", 4, "upkm", 34);
use qadbt;
delete from SeleniumDemo WHERE name = "janani";
use qadbt;
select name,
case
when id>2 then "it is greater than 2"
else "it is less than 2"
end as myCondition
from SeleniumDemo;
select name from SeleniumDemo where exists (select colour from fav where fav.id=SeleniumDemo.id and id = 1);
use qadbt;
DELIMITER //
CREATE PROCEDURE getAll()
BEGIN
	SELECT *  FROM SeleniumDemo;
END //
DELIMITER ;
call getall();
use qadbt;
call getfav();



select * from SeleniumDemo where id = 2;
use qadbt;
update SeleniumDemo set age = 8 where id =2;
select * from SeleniumDemo;
describe SeleniumDemo;
use qadbt;
select name, concat(id, ",", location) as address from SeleniumDemo;
select * from SeleniumDemo where id between 1 and 3;
-- in refers to OR operation
select * from SeleniumDemo where id in (1,2,3);
select * from SeleniumDemo where id not in (1,2,3);
select * from SeleniumDemo where name like "dar%";
select min(id) as minId from SeleniumDemo;
select count(id), name from SeleniumDemo GROUP BY name;
select sum(id) from SeleniumDemo;
select * from SeleniumDemo order by name desc;
select * from SeleniumDemo limit 2;
select * from SeleniumDemo order by age asc;
select * from SeleniumDemo where id=1 or name = "darshini";
select * from SeleniumDemo where id=1 or id=2;
insert into SeleniumDemo values('janani', 1, 'spokane', 32);
show databases;
use qadbt;
select * from SeleniumDemo;
select id from fav union select id from SeleniumDemo;
select * from fav join SeleniumDemo on fav.id = SeleniumDemo.id;
select * from fav right join SeleniumDemo on fav.id = SeleniumDemo.id;
select * from fav left join SeleniumDemo on fav.id = SeleniumDemo.id;
select * from fav, SeleniumDemo where fav.id = SeleniumDemo.id;
insert into fav values(5, "green");
select * from fav, SeleniumDemo where fav.id = SeleniumDemo.id;
select colour, name from fav, SeleniumDemo where fav.id=SeleniumDemo.id;
select f.colour, s.name from fav as f, SeleniumDemo as s where f.id=s.id;
insert into SeleniumDemo values("darani", 7, "india", 60);
insert into fav (id) select id from SeleniumDemo;
select * from fav;
select count(id), name from SeleniumDemo group by name;
select * from fav;
insert into fav values(1, "yellow");
insert into fav values(2, "red");
insert into fav values(3, "pink");
insert into fav values(4, "blue");
describe fav;
create table fav(id int, colour varchar(15));
create table hobby(id int, myhob varchar(15), primary key(id)); 
insert into hobby values(1, "radio");
create table shape(id int,  myshape varchar(15), foreign key(id) references hobby(id)); 
insert into shape values(2, "square");
insert into shape values(1, "square");
select * from fav;
alter table shape
add check (id>6);
alter table shape
alter myshape set default "rectangle";
insert into shape values(3, "triangle");
create index index_myfav on fav(colour);
create view chumma as
select * from SeleniumDemo;
select * from chumma;
select userchummanamecountry_codes();