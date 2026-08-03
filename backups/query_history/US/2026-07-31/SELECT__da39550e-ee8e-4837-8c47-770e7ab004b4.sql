-- job_id: da39550e-ee8e-4837-8c47-770e7ab004b4
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:34:16.520000+00:00
-- started: 2026-07-31T16:34:16.621000+00:00
-- ended: 2026-07-31T16:34:16.732000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
