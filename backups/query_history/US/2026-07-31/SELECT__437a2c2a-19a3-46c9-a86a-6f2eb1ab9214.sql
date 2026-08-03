-- job_id: 437a2c2a-19a3-46c9-a86a-6f2eb1ab9214
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:49:58.039000+00:00
-- started: 2026-07-31T12:49:58.151000+00:00
-- ended: 2026-07-31T12:49:58.240000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
