-- job_id: 2f71eff6-9b47-4b04-8252-78fb97fd5cd7
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:34:36.126000+00:00
-- started: 2026-07-31T16:34:36.231000+00:00
-- ended: 2026-07-31T16:34:36.332000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
