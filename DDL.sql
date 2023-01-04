-- DDL data definition language statements
--Create table syntax
--CREATE TABLE table_name( col_name DATA_TYPE, ... )

--Naming convention, table name is usually all lowercase and singular. Customers has to be customer

create table customer(
--column_name DATATYPE <CONSTRAINTS>,
	customer_id serial primary key, --Specifies that it has to be unique and not null
	first_name VARCHAR(50) not null, -- column cannot be empty
	last_name VARCHAR(50) not null, -- column cannot be empty
	address VARCHAR(100),
	email VARCHAR(50),
	loyalty_member boolean default false -- if they don't specify that they are a loyalty member, it will automatically say that they aren't
);

select *
from customer;

create table "order"(
	order_id serial primary key,
	order_date TIMESTAMP default CURRENT_TIMESTAMP,
	date_shipped TIMESTAMP,
	customer_id INTEGER not null, -- column cannot be empty,
	foreign key(customer_id) references customer(customer_id)
);

select *
from "order";

--add column to a table
-- ALTER TABLE table_name ADD COLUMN column_name DATATYPE
alter table customer
add column username VARCHAR(20);

-- change datatype of column
--syntax
-- ALTER TABLE table_name ALTER COLUMN col_name TYPE NEW_DATATYPE
alter table customer
alter column email type VARCHAR(30);


--Create Order-Product Table (Join table between the separate order and product tables)
create table order_product(
	order_id INTEGER not null,
	foreign key(order_id) REFERENCES "order"(order_id),
	product_id INTEGER not null
	--foreign key(product_id) REFERENCES product(product_id)
);

create table product(
	product_id serial primary key,
	product_name VARCHAR(25),
	description VARCHAR(200),
	price NUMERIC(5,2)
)

--Alter the order_product table to add foreign key column
alter table order_product
add foreign key(product_id) references product(product_id);

--rename a table
alter table product
rename to item;

alter table item
rename to product;

create table test(
	test_id serial primary key,
	column_1 integer,
	column_2 boolean
);

--altering column name in a table

alter table test
rename column column_1 to column_one;

--dropping a column from a table

alter table test
drop column_one;

SELECT * FROM test;

--to delete table, use drop
--if it exists, it will drop it, otherwise it will skip it
--syntax
--DROP TABLE IF EXISTS table_name_to_drop
drop table if exists test;

--create seller table

create table seller(
	seller_id serial primary key,
	name VARCHAR(50) not null,
	description VARCHAR(200),
	email VARCHAR(50)
);

create table category(
	category_id serial primary key,
	cat_name VARCHAR(50) not null,
	color VARCHAR(50)
)

--add column to product table before we add foreign keys
alter table product
add column seller_id integer not null;

alter table product
add column category_id integer not null;



--add foreign keys to those new columns
alter table product
add foreign key(seller_id) references seller(seller_id);

alter table product
add foreign key(category_id) references category(category_id);




