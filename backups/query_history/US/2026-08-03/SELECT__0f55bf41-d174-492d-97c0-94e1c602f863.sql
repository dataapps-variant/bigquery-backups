-- job_id: 0f55bf41-d174-492d-97c0-94e1c602f863
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:45:14.887000+00:00
-- started: 2026-08-03T12:45:15.014000+00:00
-- ended: 2026-08-03T12:45:15.210000+00:00


    WITH latest AS (
        SELECT MAX(event_date) AS max_date
        FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
        WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 2 DAY)
    ),
    today_data AS (
        SELECT
            r.event_date,
            r.app_name,
            r.display_url_domain,
            r.impression_share AS impression_today,
            r.rank_today,
            r.rank_yesterday,
            r.rank_change
        FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked` r
        CROSS JOIN latest l
        WHERE r.event_date = l.max_date
            AND r.rank_change != 0
    ),
    yesterday_impression AS (
        SELECT
            r.app_name,
            r.display_url_domain,
            r.impression_share AS impression_yesterday
        FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked` r
        CROSS JOIN latest l
        WHERE r.event_date = DATE_SUB(l.max_date, INTERVAL 1 DAY)
    )
    SELECT
        t.event_date,
        t.app_name,
        t.display_url_domain,
        t.impression_today,
        IFNULL(y.impression_yesterday, 0) AS impression_yesterday,
        t.rank_today,
        t.rank_yesterday,
        t.rank_change
    FROM today_data t
    LEFT JOIN yesterday_impression y
        ON t.app_name = y.app_name
        AND t.display_url_domain = y.display_url_domain
    ORDER BY t.app_name, ABS(t.rank_change) DESC
