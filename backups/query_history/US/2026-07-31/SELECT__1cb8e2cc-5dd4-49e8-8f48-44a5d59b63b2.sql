-- job_id: 1cb8e2cc-5dd4-49e8-8f48-44a5d59b63b2
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:01.245000+00:00
-- started: 2026-07-31T12:50:01.360000+00:00
-- ended: 2026-07-31T12:50:01.529000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
