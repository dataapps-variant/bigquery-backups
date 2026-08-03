-- job_id: a0ba7248-bb01-40c1-a648-3afde7ac0338
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:31:44.462000+00:00
-- started: 2026-07-31T16:31:44.669000+00:00
-- ended: 2026-07-31T16:31:44.816000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
