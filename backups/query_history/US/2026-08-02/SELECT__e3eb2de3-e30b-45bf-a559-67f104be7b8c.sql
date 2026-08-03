-- job_id: e3eb2de3-e30b-45bf-a559-67f104be7b8c
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:01:15.311000+00:00
-- started: 2026-08-02T12:01:15.416000+00:00
-- ended: 2026-08-02T12:01:15.625000+00:00


    SELECT DISTINCT account_name
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets`
    WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 7 DAY)
