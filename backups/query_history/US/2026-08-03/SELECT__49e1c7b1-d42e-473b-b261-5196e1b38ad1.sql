-- job_id: 49e1c7b1-d42e-473b-b261-5196e1b38ad1
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:02:03.709000+00:00
-- started: 2026-08-03T12:02:03.894000+00:00
-- ended: 2026-08-03T12:02:04.125000+00:00


    SELECT DISTINCT account_name
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`
    WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 7 DAY)
