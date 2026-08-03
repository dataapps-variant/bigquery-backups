-- job_id: b0cb6128-39a9-4f1b-aa7f-48f1fa8e7060
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:36:04.486000+00:00
-- started: 2026-07-31T16:36:04.631000+00:00
-- ended: 2026-07-31T16:36:04.737000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
