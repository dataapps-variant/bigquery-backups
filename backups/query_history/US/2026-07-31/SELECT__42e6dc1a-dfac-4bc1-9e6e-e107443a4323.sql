-- job_id: 42e6dc1a-dfac-4bc1-9e6e-e107443a4323
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:35:30.033000+00:00
-- started: 2026-07-31T16:35:30.107000+00:00
-- ended: 2026-07-31T16:35:30.243000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
