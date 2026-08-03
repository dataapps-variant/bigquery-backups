-- job_id: f898ae56-4003-43d4-96d7-f53d222aae1c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:14:02.003000+00:00
-- started: 2026-07-31T13:14:02.138000+00:00
-- ended: 2026-07-31T13:14:02.278000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
