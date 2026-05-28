/*
========================================================
QUERY 1 — Total Revenue by Product Category Per Month

Business Question:
Which product category generates the most revenue each month?
Are there seasonal trends?

Business Importance:
Used as a monthly FP&A revenue report to identify
high-performing categories and seasonal sales patterns.

Concepts Used:
- STRFTIME()
- GROUP BY
- SUM()
- ORDER BY
========================================================
*/
select
format(order_date,'yyyy-MM') as order_month,
Category,
round(sum(sales),2) as Total_revenue,
count(distinct(order_id)) as total_orders
from Superstore
group by
format(order_date,'yyyy-MM'),
Category
order by
order_month asc,
Total_revenue asc;

/*
Insight:
Technology and Office Supplies showed consistent
monthly revenue growth, while Furniture displayed
more seasonal fluctuations.
*/
