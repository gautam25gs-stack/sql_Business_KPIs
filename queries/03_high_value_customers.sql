/*
========================================================
QUERY 3 — Customers Who Spent Over $1000 in First 30 Days

Business Question:
Which customers made high-value purchases early? finding the top customers based on their purchasing habits

Business Importance:
Identifies high-potential customers for loyalty programmes,
Top Customers onboarding and targeted retention campaigns for increased revenue and better customer lifetime value.

Concepts Used:
- JOIN with subquery
- MIN() for first order date
- DATEDIFF() for date difference
- HAVING for post-aggregation filter
========================================================
*/
select
s.Customer_name,
round(sum(sales),2) as total_spend
from 
Superstore s
join
(
select
Customer_name,
min(Order_Date) as first_Order
from Superstore
group by 
Customer_Name) f
on s.Customer_Name = f.Customer_Name
where DATEDIFF(day,f.first_Order,s.Order_Date)<=30
group by s.Customer_Name
having sum(sales) >1000
order by total_spend desc;


/*
Insight:
The first customer topped the list at $23,661 in spend within
His first 30 days were nearly twice the next highest buyer.
The top 5 early high-value customers collectively spent
over $57,000 in their first month, making them prime
candidates for a customer loyalty programme.
*/
