CREATE TABLE `qadbt`.`customer` (
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `age` INT NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`));

CREATE TABLE `qadbt`.`orders` (
  `order_number` INT NOT NULL,
  `customer_id` INT NULL,
  `order_date` DATE NULL,
  `quantity` INT NULL,
  `unit_price` INT NULL,
  PRIMARY KEY (`order_number`),
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `qadbt`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
INSERT INTO `qadbt`.`customer` (`customer_id`,`name`,`gender`,`age`,`city`,`state`) VALUES (1,'Dinesh','Male',34,'Spokane','WA');
INSERT INTO `qadbt`.`customer` (`customer_id`,`name`,`gender`,`age`,`city`,`state`) VALUES (2,'Abhi','Female',33,'Texas','VA');
INSERT INTO `qadbt`.`customer` (`customer_id`,`name`,`gender`,`age`,`city`,`state`) VALUES (3,'Surendar','Male',34,'Portland','OR');
INSERT INTO `qadbt`.`customer` (`customer_id`,`name`,`gender`,`age`,`city`,`state`) VALUES (4,'Amar','Male',30,'Dallas','VA');
COMMIT;

INSERT INTO `qadbt`.`orders` (`order_number`,`customer_id`,`order_date`,`quantity`,`unit_price`) VALUES (100, 1, '2023-06-27', 1, 105);
INSERT INTO `qadbt`.`orders` (`order_number`,`customer_id`,`order_date`,`quantity`,`unit_price`) VALUES (101, 1, '2023-06-26', 1, 10);
INSERT INTO `qadbt`.`orders` (`order_number`,`customer_id`,`order_date`,`quantity`,`unit_price`) VALUES (102, 1, '2022-06-27', 3, 5);
INSERT INTO `qadbt`.`orders` (`order_number`,`customer_id`,`order_date`,`quantity`,`unit_price`) VALUES (103, 1, '2023-06-27', 1, 105);
INSERT INTO `qadbt`.`orders` (`order_number`,`customer_id`,`order_date`,`quantity`,`unit_price`) VALUES (104, 2, '2022-05-20', 100, 1);
INSERT INTO `qadbt`.`orders` (`order_number`,`customer_id`,`order_date`,`quantity`,`unit_price`) VALUES (105, 2, '2023-06-10', 10, 5);
INSERT INTO `qadbt`.`orders` (`order_number`,`customer_id`,`order_date`,`quantity`,`unit_price`) VALUES (106, 3, '2020-01-27', 1, 90);
INSERT INTO `qadbt`.`orders` (`order_number`,`customer_id`,`order_date`,`quantity`,`unit_price`) VALUES (107, 3, '2021-11-27', 20, 10);
INSERT INTO `qadbt`.`orders` (`order_number`,`customer_id`,`order_date`,`quantity`,`unit_price`) VALUES (108, 4, '2022-10-27', 1, 80);
INSERT INTO `qadbt`.`orders` (`order_number`,`customer_id`,`order_date`,`quantity`,`unit_price`) VALUES (109, 1, '2020-01-27', 1, 200);
COMMIT;

use qadbt;
select * from orders;
use qadbt;
select * from customer;

use qadbt;
select 
CASE WHEN customer.state = 'VA' THEN 'VIRGINA'
ELSE 'OTHER' END
as State, 
concat('$',cast(sum(orders.quantity*orders.unit_price) as char)) as "Total Sales"
from customer 
inner join orders
on customer.customer_id = orders.customer_id
where customer.state = "VA" group by customer.state ;

use qadbt;
select * from customer intersect select * from customer;
select * from orders where customer_id = "1";
select orders.order_number, customer.name, orders.unit_price, orders.quantity, customer.customer_id from customer left join orders on orders.customer_id = customer.customer_id;
select * from orders;

select customer.state as State, sum(orders.quantity*orders.unit_price) as "Total Sales"
from customer
inner join orders
on customer.customer_id = orders.customer_id
group by State;

use qadbt;
select * ,
case 
when age<33 then "adult"
else "aged"
end
from customer;
explain customer;
show tables;
select * from customer;
select count(*) from customer;
select * from customer where age between 30 and 34;
select * from customer where state <> "VA";
select * from customer where gender in ("male", "female");
select * from customer;
SELECT *,
dense_rank() over(order by age) cus
FROM customer;
SELECT *,
rank() over(order by age) cus
FROM customer;
SELECT *,
row_number() over(order by age) cus
FROM customer;