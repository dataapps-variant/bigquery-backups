-- job_id: 1e4b357c-66ed-4292-959e-fbb41d9e9972
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:55.447000+00:00
-- started: 2026-08-03T12:37:55.544000+00:00
-- ended: 2026-08-03T12:37:55.822000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
