/*
========================================================
QUERY 5 — Categories with Declining Profit Margins

Business Question:
Which categories have worsening profit margins year over year?

Business Importance:
Analysing whether increasing revenue is associated with rising profitability or not.
targeting low profit making products and categories
Concepts Used:
- LAG() window function with PARTITION BY
- YEAR() date function
- Subquery for margin calculation
- CASE WHEN for trend classification
========================================================
*/

SELECT
    category,
    order_year,
    ROUND(total_revenue, 2)   AS Total_Revenue,
    ROUND(Total_profit, 2)    AS Total_Profit,
    ROUND(Profit_Margin, 2)   AS Current_Margin,
    ROUND(LAG(Profit_Margin) OVER (
        PARTITION BY category
        ORDER BY order_year
    ), 2)                     AS Previous_Margin,
    CASE
        WHEN Profit_Margin < LAG(Profit_Margin) OVER (
            PARTITION BY category
            ORDER BY order_year)
        THEN 'DECLINING'
        ELSE 'STABLE/GROWING'
    END                       AS Margin_Trend
FROM
(
    SELECT
        category,
        YEAR(Order_date)                        AS order_year,
        ROUND(SUM(sales), 2)                    AS total_revenue,
        ROUND(SUM(profit), 2)                   AS Total_profit,
        ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS Profit_Margin  -- rounded here
    FROM superstore
    GROUP BY
        category,
        YEAR(Order_date)
) Pt;

/*
Insight:
Furniture is the most concerning category — revenue grew
But profit margins declined, growing revenue with shrinking
Margins are a sign of excessive discounting.
Office Supplies is the healthiest segment, with margins
improving from 14.89% to 19%+ over the same period.
*/
