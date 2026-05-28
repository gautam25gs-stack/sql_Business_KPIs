/*
========================================================
QUERY 2 — Top 10 Products by Revenue in Each Category
Business Question:
Within each category, which products drive the most revenue?
Business Importance:
Identifies the top-performing SKUs per category to guide
inventory, marketing, and pricing decisions.
Concepts Used:
- Subquery
- ROW NUMBER window function
- PARTITION BY
- WHERE filter
========================================================
*/

select *
from
(
select
category,
Product_name,
round(sum(sales),2) as total_revenue,
ROW_NUMBER () over( partition by category
order by sum(sales) desc) as rank_num
from Superstore
group by 
Category,
Product_Name ) as ranked_products
WHERE rank_num <=10

ORDER BY
Category,
rank_num;

/*
Insight:
Fellowes PB500 binding machine topped Office Supplies
at $27,453, while HON 5400 Task Chairs led Furniture
at $21,870. A small set of SKUs drives the majority
of revenue in each category — a classic 80/20 pattern
signalling concentration risk in inventory planning.
*/
