-- job_id: a2b73df5-4df5-49ec-85b6-1ff1aae27514
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:00:23.901000+00:00
-- started: 2026-08-01T12:00:23.982000+00:00
-- ended: 2026-08-01T12:00:24.286000+00:00


    SELECT status FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_pipeline_log`
    WHERE run_date = '2026-07-31' AND status = 'complete'
    LIMIT 1
