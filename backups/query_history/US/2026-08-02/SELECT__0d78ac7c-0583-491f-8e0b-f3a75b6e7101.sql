-- job_id: 0d78ac7c-0583-491f-8e0b-f3a75b6e7101
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:00:39.847000+00:00
-- started: 2026-08-02T12:00:39.950000+00:00
-- ended: 2026-08-02T12:00:40.245000+00:00


    SELECT status FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_pipeline_log`
    WHERE run_date = '2026-08-01' AND status = 'complete'
    LIMIT 1
