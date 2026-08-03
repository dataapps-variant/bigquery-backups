-- job_id: f30ffc2e-8e76-4157-845c-8ed1b48ab79e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:03.615000+00:00
-- started: 2026-07-31T12:50:03.709000+00:00
-- ended: 2026-07-31T12:50:03.809000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
