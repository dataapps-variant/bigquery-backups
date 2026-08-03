-- job_id: 95fe71a4-98c6-4c8c-86cf-87ad7e67602e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: None
-- created: 2026-07-31T12:33:38.577000+00:00
-- started: 2026-07-31T12:33:38.728000+00:00
-- ended: 2026-07-31T12:33:38.728000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
