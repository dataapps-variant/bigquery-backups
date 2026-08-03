-- job_id: 43331325-50eb-4bd3-af4f-1d40772a6540
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T08:09:24.642000+00:00
-- started: 2026-07-31T08:09:24.728000+00:00
-- ended: 2026-07-31T08:09:24.946000+00:00


    SELECT DISTINCT account_name
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`
    WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 7 DAY)
