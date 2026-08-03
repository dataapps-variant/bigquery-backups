-- job_id: c266a949-5a03-4b99-a3bd-dac0aa222973
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:17:03.685000+00:00
-- started: 2026-07-31T13:17:03.777000+00:00
-- ended: 2026-07-31T13:17:03.869000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
