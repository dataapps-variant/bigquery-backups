-- job_id: a512871e-694b-453f-a0b7-e1c76b263596
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:17:40.519000+00:00
-- started: 2026-07-31T15:17:40.617000+00:00
-- ended: 2026-07-31T15:17:40.736000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
