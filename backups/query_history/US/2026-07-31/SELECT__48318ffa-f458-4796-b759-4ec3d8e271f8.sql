-- job_id: 48318ffa-f458-4796-b759-4ec3d8e271f8
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:17:47.536000+00:00
-- started: 2026-07-31T15:17:47.610000+00:00
-- ended: 2026-07-31T15:17:47.764000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
