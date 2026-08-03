-- job_id: a10a45ae-b569-453f-b5b3-34162e2cc88b
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:34:29.264000+00:00
-- started: 2026-07-31T16:34:29.345000+00:00
-- ended: 2026-07-31T16:34:29.473000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
