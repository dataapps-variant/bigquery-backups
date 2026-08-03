-- job_id: 333b4fc1-7161-4ba3-a225-550c045728ca
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:45:10.983000+00:00
-- started: 2026-08-01T12:45:11.088000+00:00
-- ended: 2026-08-01T12:45:11.299000+00:00


        SELECT DISTINCT app_name
        FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
        WHERE event_date = (
            SELECT MAX(event_date) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
            WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 2 DAY)
        )
