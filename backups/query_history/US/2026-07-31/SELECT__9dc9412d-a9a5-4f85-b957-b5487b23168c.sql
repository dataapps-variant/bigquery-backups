-- job_id: 9dc9412d-a9a5-4f85-b957-b5487b23168c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:20:52.816000+00:00
-- started: 2026-07-31T15:20:52.995000+00:00
-- ended: 2026-07-31T15:20:53.099000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
