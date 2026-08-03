-- job_id: 36aa89bd-50d9-45ce-a43a-f5f9dde89c27
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:34.908000+00:00
-- started: 2026-07-31T12:50:34.962000+00:00
-- ended: 2026-07-31T12:50:35.032000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
