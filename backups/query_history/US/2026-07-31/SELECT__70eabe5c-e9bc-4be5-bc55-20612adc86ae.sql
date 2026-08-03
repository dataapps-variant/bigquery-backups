-- job_id: 70eabe5c-e9bc-4be5-bc55-20612adc86ae
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:35:32.029000+00:00
-- started: 2026-07-31T16:35:32.100000+00:00
-- ended: 2026-07-31T16:35:32.208000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
