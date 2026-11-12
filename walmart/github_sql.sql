use walmart_db;
select *from walmart limit 100;
-- describe walmart;
-- select distinct payment_method from walmart;
--  select  payment_method,count(*)
--  from walmart
--  group by payment_method;
-- select count(distinct branch)
-- from walmart;
-- select max(quantity) from walmart;
-- Q1 find the diffrent payment method and number of transaction,number of quantity sold

-- select  payment_method,count(*) as number_of_payments, sum(quantity) as no_of_quantity_sold
--  from walmart
--  group by payment_method;
-- Q-identify the highest_rated category in each branch,display the branch,category,avg rating
-- select *
-- from
-- (
-- select
-- branch,category,
-- avg(rating) as avg_rating,
-- rank() over(partition by branch order by avg(rating)desc) as rank_a
-- from walmart
-- group by branch,category
-- ) as sub
-- where rank_a=1;
-- Q3 identify the busisent day for each branch based on the number of transaction

 -- select * from walmart limit 10;
--  select *
--  from
--  (
-- SELECT
--     branch,
--     DAYNAME(STR_TO_DATE(date, '%d/%m/%y')) AS day_name,
--     count(*) as no_transaction,
--     rank() over(partition by branch order by count(*)desc)as rnk
-- FROM walmart
-- group by branch,day_name
-- ) as a
-- where rnk=1
-- Q4 calculate the total quantity of items sold per paymnet method list payment_method and totalquantity
-- select payment_method,
-- -- count(*)as no_payment,
-- sum(quantity)as no_of_qty_sold
-- from walmart
-- group by payment_method
-- Q5 determine the average, minimum and maximum rating of category for each city
-- list the city,average_rating,min_rating,and max_rating
-- select
--   city,
--   category,
--   min(rating) as min_rating,
--   max(rating) as max_rating,
--   avg(rating) as avg_rating
--   from walmart
--   group by city,category
-- 6. Top 5 branches by revenue
-- SELECT Branch, SUM(total) AS revenue
-- FROM walmart
-- GROUP BY Branch
-- ORDER BY revenue DESC
-- LIMIT 5;
-- 7. City-wise total profit
-- SELECT City, SUM(total * profit_margin) AS profit
-- FROM walmart
-- GROUP BY City;
-- 8. Har city ki average rating
SELECT City, AVG(rating)
FROM walmart
GROUP BY City;
-- Q9calculate the total profit for each category by consideryng 
-- total_profit list catogry and total_profit,order from highest
-- to lowest profit.
-- select
-- category,
-- sum(total*profit_margin)as total_profit
-- from walmart
-- group by category
-- Q10 determine the most common payment method for each branch
-- display branch and the preferred_payment_method
-- with cte
-- as
-- (
-- select
-- branch,
-- payment_method,
-- count(*)as total_trns,
-- rank() over(partition by branch order by count(*)desc)as rnk
-- from walmart
-- group by branch,payment_method
-- )
-- select * from cte
-- where rnk=1
-- Q11 categorize sales into 3 group morning,afternon,evening
-- find out each of the shift and number of invoices
-- SELECT
--     CASE
--         WHEN HOUR(TIME(time)) < 12 THEN 'Morning'
--         WHEN HOUR(TIME(time)) BETWEEN 12 AND 17 THEN 'Afternoon'
--         ELSE 'Evening'
--     END AS day_time,
--     COUNT(*) AS total_invoices
-- FROM walmart
-- GROUP BY day_time;






