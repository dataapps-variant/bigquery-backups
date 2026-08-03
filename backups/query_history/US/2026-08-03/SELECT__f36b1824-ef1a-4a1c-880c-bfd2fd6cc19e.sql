-- job_id: f36b1824-ef1a-4a1c-880c-bfd2fd6cc19e
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:00:24.942000+00:00
-- started: 2026-08-03T12:00:25.095000+00:00
-- ended: 2026-08-03T12:00:25.464000+00:00


    SELECT status FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_pipeline_log`
    WHERE run_date = '2026-08-02' AND status = 'complete'
    LIMIT 1
