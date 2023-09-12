create table cust(customer_id int, name varchar(20), phone_number varchar(22), country varchar(10));
insert into cust values(1, "Raghav", "912494", "India");
insert into cust values(2, "Jake", "822083", "USA");
insert into cust values(3, "Alice", "80562", "USA");
insert into cust values(4, "Maze", "90562", "UAE");
insert into cust values(5, "Etzy", "34508", "France");
insert into cust values(6, "Betzy", "89456", "Norway");

delete from cust where country="UAE";
select * from cust;
select name from cust where customer_id>2 order by right(name, 3) ASC, customer_id asc;

select country, length(country) from cust order by length(country) asc, country asc limit 1;
select country, length(country) from cust order by length(country) desc, country asc limit 1;
select distinct name from cust WHERE NAME not REGEXP "^[aeiou]" and name not regexp ".*[aeiou]$";
select distinct city from station WHERE city not REGEXP "^[aeiou].*[aeiou]$";

create table country_codes(country varchar(10),country_code int);
insert into country_codes values("India", 91);
insert into country_codes values("USA", 1);

select cust.name, concat("+",country_codes.country_code,cust.phone_number) as phone from cust join country_codes on cust.country=country_codes.country;
select (count(country) - count(distinct country)) from cust;
select *from cust having country = 'India';
select distinct * from cust;
select count(distinct country) from cust;
select * from cust;
update cust set population = 200 where id = 6;
update cust set population = 300 where id = 3;
update cust set population = 400 where id = 4;
update cust set population = 500 where id = 5;

alter table cust add column population bigint;

alter table students rename cust;
select * from orders;
alter table cust rename column customer_id to id;
explain cust;
select round(avg(unit_price)) from orders;

/* sample exercise from hackerrank that i cleared*/
select distinct city.name from city join country on city.countrycode = country.code where continent = "africa";

select location_id, street_address, city, state_province, countries.country_name from locations join countries on locations.country_id = countries.country_id;

alter table orders rename column customer_id to id;
select * from cust;
select * from cust natural join orders o;

explain cust;