-- job_id: fe8b3aa9-1fcf-4d48-96bc-192a2a0c5bda
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:34:25.708000+00:00
-- started: 2026-07-31T16:34:25.797000+00:00
-- ended: 2026-07-31T16:34:25.941000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
