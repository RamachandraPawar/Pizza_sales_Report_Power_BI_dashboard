select *
from [dbo].[pizza]


--total pizza sold
select sum([quantity]) as total_pizza_sold
from [dbo].[pizza]

--total orders
select  count(distinct [order_id]) as total_orders
from [dbo].[pizza]

--total revenue
select cast(sum([total_price]) as decimal (10,2)) as total_revenue
from [dbo].[pizza]

--Average_pizzas_per_order
SELECT cast(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) as decimal (10,2)) AS Average_pizzas_per_order
FROM [dbo].[pizza]

--avg_order_value
SELECT cast( cast(sum([total_price]) as decimal (10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) as decimal (10,2)) AS Average_pizzas_per_order
FROM [dbo].[pizza]

--weekdays_trend
select datename(WEEKDAY, [order_date]) as days ,count(distinct [order_id]) as total_orders
from [dbo].[pizza]
group by datename(WEEKDAY, [order_date])

--monthly_trend
select datename(MONTH, [order_date]) as month ,count(distinct [order_id]) as total_orders
from [dbo].[pizza]
group by datename(MONTH, [order_date])

--total orders by pizza category
select [pizza_category], count(distinct [order_id]) as total_orders
from [dbo].[pizza]
group by [pizza_category]

--% of revenue by pizza category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [dbo].[pizza]) AS DECIMAL(10,2)) AS PCT
FROM [dbo].[pizza]
GROUP BY pizza_category

--Top 5 pizza by revenue
select top 5 [pizza_name],sum([total_price]) as Total_Revenue
from [dbo].[pizza]
group by [pizza_name]
order by Total_Revenue desc

--Bottom 5 pizza by revenue
select top 5 [pizza_name],sum([total_price]) as Total_Revenue
from [dbo].[pizza]
group by [pizza_name]
order by Total_Revenue 

--Top 5 pizza by total_pizza_sold
select top 5 [pizza_name], sum([quantity]) as total_pizza_sold
from [dbo].[pizza]
group by [pizza_name]
order by total_pizza_sold desc

--Bottom 5 pizza by total_pizza_sold
select top 5 [pizza_name], sum([quantity]) as total_pizza_sold
from [dbo].[pizza]
group by [pizza_name]
order by total_pizza_sold 

--Top 5 pizza by orders
select top 5 [pizza_name], count(distinct [order_id]) as total_orders
from [dbo].[pizza]
group by [pizza_name]
order by total_orders desc

--Bottom 5 pizza by orders
select top 5 [pizza_name], count(distinct [order_id]) as total_orders
from [dbo].[pizza]
group by [pizza_name]
order by total_orders 