-- job_id: 984176ec-8345-438f-8445-a3521b99df59
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:27:24.719000+00:00
-- started: 2026-07-31T13:27:24.795000+00:00
-- ended: 2026-07-31T13:27:24.877000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
