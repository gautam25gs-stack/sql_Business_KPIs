/*
========================================================
QUERY 4 — Month Over Month Revenue Growth %

Business Question:
Is revenue growing or declining each month?
By what percentage?

Business Importance:
MoM growth is the single most important metric,
It shows momentum, seasonal dips, and
whether the business is on a growth trajectory.

Concepts Used:
- LAG() window function
- ROUND()
- CASE WHEN for growth/decline classification
- Subquery for monthly aggregation
========================================================
*/

SELECT
    Order_month,
    ROUND(monthly_rev, 2)    AS current_rev,
    ROUND(last_month_rev, 2) AS previous_rev,
    ROUND(
        (monthly_rev - last_month_rev)
        / last_month_rev * 100
    , 2) AS MoM_percent,
    CASE
        WHEN monthly_rev > last_month_rev THEN 'GROWTH'
        WHEN monthly_rev < last_month_rev THEN 'DECLINE'
        ELSE 'FLAT'
    END AS Trend
FROM
(
    SELECT
        FORMAT(Order_date, 'yyyy-MM')        AS Order_month,
        ROUND(SUM(sales), 2)                 AS monthly_rev,
        LAG(ROUND(SUM(sales), 2)) OVER (
            ORDER BY FORMAT(Order_date, 'yyyy-MM')
        )                                    AS last_month_rev
    FROM superstore
    GROUP BY FORMAT(Order_date, 'yyyy-MM')
) MONTHLY
WHERE last_month_rev IS NOT NULL;

/*
Insight:
Revenue is highly volatile month-to-month, swinging from
Dipping in February 2014 to surging in March 2014.
September consistently shows the largest positive MoM jump
across years, likely driven by corporate budget cycles.

*/
