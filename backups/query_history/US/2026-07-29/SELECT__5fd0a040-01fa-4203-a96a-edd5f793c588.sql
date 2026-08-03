-- job_id: 5fd0a040-01fa-4203-a96a-edd5f793c588
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:01:28.894000+00:00
-- started: 2026-07-29T12:01:29.006000+00:00
-- ended: 2026-07-29T12:01:29.213000+00:00


    SELECT DISTINCT account_name
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`
    WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 7 DAY)
