-- job_id: f12b3fdf-5c37-4805-8c78-34036b0ab178
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:45:26.318000+00:00
-- started: 2026-07-28T12:45:26.408000+00:00
-- ended: 2026-07-28T12:45:26.610000+00:00


        SELECT DISTINCT app_name
        FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
        WHERE event_date = (
            SELECT MAX(event_date) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
            WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 2 DAY)
        )
