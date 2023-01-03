--Add a row of data to the customer table
--syntax: INSERT INTO table_name(col_1, col_2, etc.) values(val_1, val_2, etc.)

insert into customer(
	first_name,
	last_name,
	email,
	loyalty_member,
	username
) values (
	'Robert',
	'Flobbert',
	'robbertflobbert@gmail.com',
	true,
	'robbertf'
);

select *
from customer;

--insert data without column names
--this is wrong because the addfress and email are switched
insert into customer values (
	3,
	'Freddie',
	'Kruger',
	'freddie@scarytown.gov',
	'321 Elm St',
	'1',
	'freddiek'
)

--only insert first name and last name
insert into customer(
	first_name,
	last_name
) values (
	'Jason',
	'Vorhees'
);

insert into seller(
	name,
	description,
	email
) values (
	'New Egg',
	'Computer parts',
	'newegggothacked@gmail.com'
);

select *
from seller;

insert into category(
	cat_name,
	color
) values (
	'raspberry pi',
	'red'
);

insert into category(
	cat_name,
	color
) values (
	'usb-drives',
	'blue'
), (
	'water-bottles',
	'clear'
);

select *
from category;

--add multiple rows of data in one command, with a foreign key
-- syntax: INSERT INTO table(col1, col2, ...) VALUES(val_a_1, val_a_2, ...), (val_b_1, val_b_2, ...)
insert into product (
	product_name,
	description,
	price,
	seller_id,
	category_id
	) values (
		'pico-pi',
		'all the rapsberry pis are sold out',
		999.99,
		1,
		1
	), (
		'usb-c',
		'I fit in an nintendo switch',
		30.00,
		1,
		2
	);

select *
from product;

insert into product (
	product_name,
	description,
	price,
	seller_id,
	category_id
	) values (
		'banana-pi',
		'all the rapsberry pis and pico pis are sold out',
		999.99,
		1,
		1
	), (
		'micro-usb',
		'I dont fit in an nintendo switch',
		30.00,
		40,
		2
	);

-- syntax: UPDATE table_name SET col_name = value, etc. WHERE condition, changes ONE person
update customer 
set address = '555 circle drive'
where customer_id = 1;

select *
from customer;

--An UPDATE/SET without a WHERE will update ALL of the rows
--PERMANENT
update customer 
set loyalty_member = false;

--A DELETE FROM without a WHERE will delete all rows
--DELETE FROM seller;

--DELETE ALL PRODUCTS THAVE A PRICE LESS THAN 999.99
--Syntax - DELETE FROM table_name WHERE condition 
delete from product
where price < 999.99;

select *
from product;
