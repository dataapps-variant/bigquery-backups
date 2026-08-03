-- job_id: 9a17a0bb-6774-45bc-86ff-7e8fe62c2afb
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:00:47.902000+00:00
-- started: 2026-07-30T12:00:47.972000+00:00
-- ended: 2026-07-30T12:00:48.179000+00:00


    SELECT DISTINCT account_name
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`
    WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 7 DAY)
