-- job_id: 0f45f43d-c28e-4a70-9376-d746f2fd6025
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:28.037000+00:00
-- started: 2026-07-31T12:50:28.126000+00:00
-- ended: 2026-07-31T12:50:28.218000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
