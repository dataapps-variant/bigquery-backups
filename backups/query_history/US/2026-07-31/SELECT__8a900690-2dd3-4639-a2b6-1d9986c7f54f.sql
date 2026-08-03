-- job_id: 8a900690-2dd3-4639-a2b6-1d9986c7f54f
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:34:25.925000+00:00
-- started: 2026-07-31T16:34:25.994000+00:00
-- ended: 2026-07-31T16:34:26.117000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
