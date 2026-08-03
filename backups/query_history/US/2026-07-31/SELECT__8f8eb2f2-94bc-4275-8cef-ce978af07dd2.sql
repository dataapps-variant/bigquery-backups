-- job_id: 8f8eb2f2-94bc-4275-8cef-ce978af07dd2
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:00:34.400000+00:00
-- started: 2026-07-31T12:00:34.503000+00:00
-- ended: 2026-07-31T12:00:34.879000+00:00


    SELECT status FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_pipeline_log`
    WHERE run_date = '2026-07-30' AND status = 'complete'
    LIMIT 1
