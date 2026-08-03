-- job_id: b648f521-1cd6-4ef3-8110-6e770e3f3583
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: None
-- created: 2026-07-31T12:33:39.001000+00:00
-- started: 2026-07-31T12:33:39.146000+00:00
-- ended: 2026-07-31T12:33:39.146000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
