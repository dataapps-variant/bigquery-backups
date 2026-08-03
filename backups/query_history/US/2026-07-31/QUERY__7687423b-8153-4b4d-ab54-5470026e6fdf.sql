-- job_id: 7687423b-8153-4b4d-ab54-5470026e6fdf
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: None
-- created: 2026-07-31T12:33:39.424000+00:00
-- started: 2026-07-31T12:33:39.557000+00:00
-- ended: 2026-07-31T12:33:39.557000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
