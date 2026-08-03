-- job_id: scheduled_query_6a95b950-0000-25d1-8374-d4f547f95ab8
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T12:30:03.054000+00:00
-- started: 2026-07-30T12:30:03.369000+00:00
-- ended: 2026-07-30T12:30:04.892000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked` AS
WITH base AS (
    SELECT DISTINCT event_date, account_name, display_url_domain,
        SAFE_CAST(impression_share AS FLOAT64) AS impression_share
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`
    WHERE impression_share IS NOT NULL AND impression_share NOT LIKE '< %'
),
prev_date AS (
    SELECT a.event_date, a.account_name, MAX(b.event_date) AS prev_event_date
    FROM (SELECT DISTINCT event_date, account_name FROM base) a
    LEFT JOIN (SELECT DISTINCT event_date, account_name FROM base) b
        ON a.account_name = b.account_name AND b.event_date < a.event_date
    GROUP BY a.event_date, a.account_name
),
ranked AS (
    SELECT event_date, account_name AS app_name, display_url_domain, impression_share,
        RANK() OVER (PARTITION BY event_date, account_name
            ORDER BY impression_share DESC) AS rank_today
    FROM base
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
    IFNULL(d.App_Name, w.app_name) AS app_name,
    w.display_url_domain,
    w.impression_share,
    w.rank_today,
    w.rank_yesterday,
    w.rank_change
FROM with_prev w
LEFT JOIN `variant-finance-data-project.vatiant_finance_Google_Query_Test.Dim_auction_app_name` d
    ON w.app_name = d.account_name;
