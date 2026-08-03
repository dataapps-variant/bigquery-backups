-- job_id: 9305ce74-401e-4643-add0-b23e1b7c4e81
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:02.374000+00:00
-- started: 2026-07-31T12:50:02.459000+00:00
-- ended: 2026-07-31T12:50:02.563000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
