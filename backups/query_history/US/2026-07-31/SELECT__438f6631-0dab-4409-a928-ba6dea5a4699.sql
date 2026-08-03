-- job_id: 438f6631-0dab-4409-a928-ba6dea5a4699
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:20:41.276000+00:00
-- started: 2026-07-31T15:20:41.395000+00:00
-- ended: 2026-07-31T15:20:41.543000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
