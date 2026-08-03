-- job_id: 71bcb11d-644f-4cfd-8221-a9fe88f5cc7b
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:21:35.598000+00:00
-- started: 2026-07-31T15:21:35.682000+00:00
-- ended: 2026-07-31T15:21:35.807000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
