-- job_id: 36a5799a-8b5c-4e57-81d4-ecee9d0646d5
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:20.682000+00:00
-- started: 2026-07-31T12:50:20.766000+00:00
-- ended: 2026-07-31T12:50:20.858000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
