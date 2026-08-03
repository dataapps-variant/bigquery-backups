-- job_id: c7f1c5bf-4c6d-4c67-8aaa-aa1c7c2db1ba
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:35:35.885000+00:00
-- started: 2026-07-31T16:35:35.960000+00:00
-- ended: 2026-07-31T16:35:36.089000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
