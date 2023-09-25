use project;
select * from storesales;

# 1. Fetch the details of all orders on the date '09/06/2015'
select * from storesales
where `Order Date`='09/06/2015';

# 2. List out the customers who ordered furnitures and are lives in southern side of United States 
select * from storesales 
where Category= 'Furniture' 
and Region='South';

# 3. Find the products and their category and sub category which cost above 500 $
select `Product Name`,Category,`Sub-Category`,Sales 
from storesales 
where Sales> 500;

# 4. Fetch the details of the products which cost highest price
select * from storesales 
order by sales desc limit 1;

# 5. Find the customer from 'Pennsylvania' who bought more product 
select `Customer Name`, count(sales) 
from storesales where State='Pennsylvania' 
group by `Customer Name` 
order by count(Sales) desc;

# 6. fetch the deatails of the customer who spent more money 
select `Customer Name`,sum(sales) from storesales 
group by `Customer Name` 
order by sum(Sales) desc limit 1;

# 7. Fetch details of the products which comes under phones and the price greater than the maximum cost of any products in chair 
select * from storesales 
where `Sub-Category`='Phones' 
and sales >  (select max(Sales) from storesales where `Sub-Category`= 'Chairs');

# 8. Calculate the average total amount spent by customers who made more than 5 purchases
select avg(sales) 
from storesales 
where `Customer ID` 
in (select `Customer ID` from storesales group by `Customer ID` having count(`Customer ID`) >5);

# 9. Calculate the total amount spent by each customers who made more than 4 purchases
select `Customer Name`,sum(sales) 
from storesales 
group by `Customer Name` 
having count(`Customer ID`) >4;

#10. Find the products with the highest and lowest prices:
select * from storesales 
where sales=(select max(sales) from storesales) 
or sales=(select min(sales) from storesales);

