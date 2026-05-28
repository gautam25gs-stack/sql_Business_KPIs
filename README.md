#  SQL Business KPI Analysis for E-commerce

##  Executive Summary

  This project is an SQL-based business analytics case study using the Superstore e-commerce dataset from Kaggle. It focuses on solving real-world business KPI      problems related to revenue analysis, customer spending behavior, product performance, profit margins, and month-over-month growth
  The project uses advanced SQL concepts such as subqueries, joins, window functions (RANK(), LAG()), GROUP BY, HAVING, CASE WHEN, and date functions to generate    business insights from using 9,994 transaction records across 4 years of e-commerce data.
  Based on the findings I provided, the following suggestions.




## Business Problem
  E-commerce stores need to know the trends related to the inventory of products and their Growth/Decline through seasonality. Businesses also need to look into     their customers' purchasing behaviour and then make decisions based on their habits. Determining the profit margin against the revenue and the month-over-month    change in purchasing trends helps in deciding the investment and financing decisions. Targeting the category and specific products helps in increasing overall     profits for the Business.




## Methodology
1. SQL query that extracts relevant data from the database.
2. Used sub-queries and window functions to categorize data as per the KPI demand.
3. Applied aggregations, filtering, ranking, and analytical SQL techniques to transform raw transactional data into KPI-focused results.

 ## Skills
 SQL: CTEs, Sub-Queries, JOINs, CASE, WINDOW(LAG, ROW number), Aggregate Functions

 ## Results & Business Recommendations
  Trend lines show that the sales in the technology category spiked, while there is a significant decline in the office supplies category. 
  (keeping SKU available for technology while increasing focus on office supplies ) 
  
  Profit Margin analysis shows that revenue in furniture increased, but the profit percentage decreased. This could be the result of excessive discounting.
  (Reducing the discounts on the top-selling products in the category to  recover profit margins)
  
  Several customers have shown significantly higher purchasing patterns, above $20,000 in their first 30 days.
  (Providing top customers with a Loyalty Programme to increase retention and lifetime value)
  
  Month-over-month analysis shows February as a consistent revenue trough, while September and Q4 spike reliably each year.
  (Running targeted promotions in February and building inventory ahead of Q4 to reduce revenue volatility)

## SQL Files

- [Revenue Analysis](queries/01_revenue_analysis.sql)
- [Top Products by Revenue](queries/02_top_products_by_revenue.sql)
- [High Value Customers](queries/03_high_value_customers.sql)
- [MoM Revenue Growth](queries/04_mom_revenue_growth.sql)
- [Declining Profit Margins](queries/05_declining_profit_margins.sql)

 ## Tools Used
   SQL Server (SSMS)
   Kaggle Superstore Dataset (9,994 records)

 
