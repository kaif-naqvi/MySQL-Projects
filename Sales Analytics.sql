-- creare tables in the database

create table sales_table
(
	transactions_id	int,
	sale_date	date,
	sale_time	time,
	customer_id	int,
	gender	varchar(20),
	age	int,
	category varchar(20),	
	quantiy	int,
	price_per_unit float,	
	cogs	float,
	total_sale float
);

-- data cleaning by finding and delating null rows

select * from sales_table
where( 
sale_date is null 
or 
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantiy is null
or 
price_per_unit is null
or
cogs is null
or 
total_sale is null)
;

-- deleting null rows

delete from sales_table 
where quantiy is null
or 
price_per_unit is null
or
cogs is null
or 
total_sale is null;

-- checking if deleted sucessfully 

select count(transactions_id)
from sales_table;

-- to retrieve all columns for sales made on '2022-11-05

select * from sales_table
where sale_date = '2022-11-05';

-- how many transactions were made on 2022-11-05

select count(transactions_id) from sales_table
where sale_date = '2022-11-05';

-- to retrieve all transactions where the category is 'Clothing' and 
-- the quantity sold is more than 4 in the month of Nov-2022

select * from sales_table
where category = 'Clothing'
and TO_CHAR(sale_date, 'yyyy-mm') = '2022-11'
and 
quantiy >= 4;

-- number of transactions
 
select count(transactions_id) from sales_table
where category = 'Clothing'
and TO_CHAR(sale_date, 'yyyy-mm') = '2022-11'
and 
quantiy >= 4;

-- to calculate the total sales (total_sale) for each category

select category,
sum(total_sale),
count(distinct transactions_id) as orders
from sales_table
group by category
order by orders desc;

-- to find the average age of customers who purchased items from the 'Beauty' category

select avg(age) as avg_age
from sales_table
where category = 'Beauty';

-- to find all transactions where the total_sale is greater than 1000

select * from sales_table
where total_sale > 1000;

select count(transactions_id) from sales_table 
where total_sale > 1000;




































