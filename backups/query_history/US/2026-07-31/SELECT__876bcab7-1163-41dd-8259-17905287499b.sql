-- job_id: 876bcab7-1163-41dd-8259-17905287499b
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:34:31.079000+00:00
-- started: 2026-07-31T16:34:31.162000+00:00
-- ended: 2026-07-31T16:34:31.235000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
