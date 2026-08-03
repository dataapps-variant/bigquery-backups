-- job_id: 53c388d7-49ba-453d-9aed-6f214be1f0a9
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:20:47.158000+00:00
-- started: 2026-07-31T15:20:47.263000+00:00
-- ended: 2026-07-31T15:20:47.359000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
