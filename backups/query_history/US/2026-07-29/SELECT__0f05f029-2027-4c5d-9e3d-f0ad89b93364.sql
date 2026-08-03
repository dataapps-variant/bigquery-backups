-- job_id: 0f05f029-2027-4c5d-9e3d-f0ad89b93364
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:00:50.166000+00:00
-- started: 2026-07-29T12:00:50.278000+00:00
-- ended: 2026-07-29T12:00:50.631000+00:00


    SELECT status FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_pipeline_log`
    WHERE run_date = '2026-07-28' AND status = 'complete'
    LIMIT 1
