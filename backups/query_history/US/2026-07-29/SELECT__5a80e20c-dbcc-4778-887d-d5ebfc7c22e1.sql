-- job_id: 5a80e20c-dbcc-4778-887d-d5ebfc7c22e1
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:45:23.756000+00:00
-- started: 2026-07-29T12:45:23.863000+00:00
-- ended: 2026-07-29T12:45:24.177000+00:00


        SELECT DISTINCT app_name
        FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
        WHERE event_date = (
            SELECT MAX(event_date) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
            WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 2 DAY)
        )
