-- job_id: e67f6d3a-f1c4-4565-abed-88d021bcbd45
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:45:13.566000+00:00
-- started: 2026-07-30T12:45:13.665000+00:00
-- ended: 2026-07-30T12:45:13.857000+00:00


        SELECT DISTINCT app_name
        FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
        WHERE event_date = (
            SELECT MAX(event_date) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
            WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 2 DAY)
        )
