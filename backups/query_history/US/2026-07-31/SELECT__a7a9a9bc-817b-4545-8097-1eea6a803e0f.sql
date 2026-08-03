-- job_id: a7a9a9bc-817b-4545-8097-1eea6a803e0f
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:34:20.355000+00:00
-- started: 2026-07-31T16:34:20.456000+00:00
-- ended: 2026-07-31T16:34:20.588000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
