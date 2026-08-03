-- job_id: d8cd0b53-dbe8-4f2f-9e11-a528c26442d2
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:45:10.917000+00:00
-- started: 2026-07-31T12:45:10.998000+00:00
-- ended: 2026-07-31T12:45:11.204000+00:00


        SELECT DISTINCT app_name
        FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
        WHERE event_date = (
            SELECT MAX(event_date) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
            WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 2 DAY)
        )
