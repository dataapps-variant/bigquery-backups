-- job_id: 4cef7105-f7a5-47d5-b44a-56f4057325be
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:27:23.007000+00:00
-- started: 2026-07-31T13:27:23.091000+00:00
-- ended: 2026-07-31T13:27:23.193000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
