-- job_id: 3c5ceba0-2294-4022-8822-3ea9e54788f0
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T08:09:00.916000+00:00
-- started: 2026-07-31T08:09:01.040000+00:00
-- ended: 2026-07-31T08:09:01.331000+00:00


    SELECT status FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_pipeline_log`
    WHERE run_date = '2026-07-30' AND status = 'complete'
    LIMIT 1
