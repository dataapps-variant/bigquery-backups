-- job_id: 9220e5ce-7e22-4083-ac58-762e39c14ebd
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:35:32.841000+00:00
-- started: 2026-07-31T16:35:32.922000+00:00
-- ended: 2026-07-31T16:35:33.026000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
