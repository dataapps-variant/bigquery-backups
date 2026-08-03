-- job_id: 74386782-f9f6-47a5-9879-cadf488a416e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:32:31.341000+00:00
-- started: 2026-07-31T16:32:31.448000+00:00
-- ended: 2026-07-31T16:32:31.551000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
