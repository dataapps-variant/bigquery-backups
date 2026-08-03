CREATE OR REPLACE TABLE `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked` AS
WITH prev_date AS (
    SELECT 
        a.event_date, a.account_name,
        MAX(b.event_date) AS prev_event_date
    FROM (SELECT DISTINCT event_date, account_name FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`) a
    LEFT JOIN (SELECT DISTINCT event_date, account_name FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`) b
        ON a.account_name = b.account_name AND b.event_date < a.event_date
    GROUP BY a.event_date, a.account_name
),
ranked AS (
    SELECT event_date, account_name AS app_name, display_url_domain,
        SAFE_CAST(impression_share AS FLOAT64) AS impression_share,
        RANK() OVER (PARTITION BY event_date, account_name
            ORDER BY SAFE_CAST(impression_share AS FLOAT64) DESC) AS rank_today
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`
    WHERE impression_share IS NOT NULL AND impression_share NOT LIKE '< %'
),
with_prev AS (
    SELECT t.*, IFNULL(y.rank_today, 0) AS rank_yesterday,
        IFNULL(y.rank_today, 0) - t.rank_today AS rank_change
    FROM ranked t
    JOIN prev_date p ON t.event_date = p.event_date AND t.app_name = p.account_name
    LEFT JOIN ranked y ON t.app_name = y.app_name 
        AND t.display_url_domain = y.display_url_domain
        AND y.event_date = p.prev_event_date
)
SELECT 
    w.event_date,
    w.display_url_domain,
    w.impression_share,
    w.rank_today,
    w.rank_yesterday,
    w.rank_change,
    d.App_Name AS app_name
FROM with_prev w
LEFT JOIN `variant-finance-data-project.vatiant_finance_Google_Query_Test.Dim_auction_app_name` d
    ON w.app_name = d.account_name;
