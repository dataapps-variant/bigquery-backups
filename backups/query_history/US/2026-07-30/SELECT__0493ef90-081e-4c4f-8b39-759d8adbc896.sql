-- job_id: 0493ef90-081e-4c4f-8b39-759d8adbc896
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:00:31.241000+00:00
-- started: 2026-07-30T12:00:31.372000+00:00
-- ended: 2026-07-30T12:00:31.645000+00:00


    SELECT status FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_pipeline_log`
    WHERE run_date = '2026-07-29' AND status = 'complete'
    LIMIT 1
