-- job_id: 23f4ff26-2b1d-4ba6-ba3c-d494c0fe2918
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:01:30.954000+00:00
-- started: 2026-07-31T12:01:31.029000+00:00
-- ended: 2026-07-31T12:01:31.220000+00:00


    SELECT DISTINCT account_name
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`
    WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 7 DAY)
