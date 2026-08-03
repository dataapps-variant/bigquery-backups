-- job_id: c3467042-9072-4989-b6e2-aafc4079e87c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:49:50.469000+00:00
-- started: 2026-07-31T12:49:50.578000+00:00
-- ended: 2026-07-31T12:49:50.782000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
