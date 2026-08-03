-- job_id: 50c15f57-726d-4171-99c4-53d7355a12c0
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:21:37.393000+00:00
-- started: 2026-07-31T15:21:37.463000+00:00
-- ended: 2026-07-31T15:21:37.554000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
