select * from pizza_sales;
select sum(total_price) as total_revenue from pizza_sales;
select sum(total_price) / count(distinct order_id) as Average_order_value from pizza_sales;
select sum(quantity) as total_pizza_sold from pizza_sales;
select count(distinct order_id) as total_orders from pizza_sales;
select cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as Average_pizzas_per_order from pizza_sales;
SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day, count(distinct order_id) as total_orders
FROM pizza_sales
group by DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY total_orders DESC;
SELECT 
    hour((order_time)) AS order_hours, count(distinct order_id) AS total_orders
FROM pizza_sales
GROUP BY hour(order_time)
ORDER BY total_orders DESC;
SELECT 
    MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month, count(distinct order_id) AS total_orders
FROM pizza_sales
GROUP BY order_month
ORDER BY total_orders DESC;
SELECT pizza_category,sum(total_price) as tota_sales, sum(total_price) *100 / (select sum(total_price) from pizza_sales where MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) =1) as PCT
from pizza_sales where MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) =1
group by pizza_category;
SELECT pizza_category,sum(total_price) as tota_sales, sum(total_price) *100 / (select sum(total_price) from pizza_sales) as PCT
from pizza_sales 
group by pizza_category;
SELECT pizza_size ,sum(total_price) as tota_sales, sum(total_price) *100 / (select sum(total_price) from pizza_sales where MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) =1) as PCT
from pizza_sales where MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) =1
group by pizza_size;
SELECT pizza_size ,CAST(sum(total_price) AS DECIMAL (10,2))  as tota_sales, CAST(sum(total_price) *100 / (select sum(total_price) from pizza_sales) AS DECIMAL (10,2)) as PCT
from pizza_sales
group by pizza_size
order by PCT DESC;
SELECT pizza_size ,sum(total_price) as tota_sales, sum(total_price) *100 / (select sum(total_price) from pizza_sales where QUARTER(STR_TO_DATE(order_date, '%d-%m-%Y')) =1) as PCT
from pizza_sales where QUARTER(STR_TO_DATE(order_date, '%d-%m-%Y')) =1
group by pizza_size;
SELECT pizza_category, SUM(quantity) AS total_quantity_sold
FROM pizza_sales

GROUP BY pizza_category
ORDER BY total_quantity_sold DESC;


SELECT pizza_name , sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc
LIMIT 5;
SELECT pizza_name , sum(total_price) as total_revenue from pizza_sales
group by pizza_name 
order by total_revenue
LIMIT 5;
SELECT pizza_name , sum(quantity) as total_quantity from pizza_sales
group by pizza_name 
order by total_quantity desc
LIMIT 5;
SELECT pizza_name , sum(quantity) as total_quantity from pizza_sales
group by pizza_name 
order by total_quantity
LIMIT 5;
SELECT pizza_name , count(distinct order_id) as total_orders from pizza_sales
group by pizza_name 
order by total_orders desc
LIMIT 5;
SELECT pizza_name , count(distinct order_id) as total_orders from pizza_sales
group by pizza_name 
order by total_orders
LIMIT 5;
