-- job_id: 4b793a51-a953-48af-9bf6-b02fd44d1e62
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:00:44.527000+00:00
-- started: 2026-07-28T12:00:44.611000+00:00
-- ended: 2026-07-28T12:00:44.984000+00:00


    SELECT status FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_pipeline_log`
    WHERE run_date = '2026-07-27' AND status = 'complete'
    LIMIT 1
