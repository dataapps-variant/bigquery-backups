-- job_id: 3685caf1-5be7-4dc3-b7ed-2753b590a3ed
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:01:00.232000+00:00
-- started: 2026-08-01T12:01:00.309000+00:00
-- ended: 2026-08-01T12:01:00.524000+00:00


    SELECT DISTINCT account_name
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`
    WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 7 DAY)
