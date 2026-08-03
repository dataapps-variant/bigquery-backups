-- job_id: 35b3af4b-7fbd-4ac3-a370-b97582c29c4b
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:01:32.322000+00:00
-- started: 2026-07-28T12:01:32.429000+00:00
-- ended: 2026-07-28T12:01:32.659000+00:00


    SELECT DISTINCT account_name
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`
    WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 7 DAY)
