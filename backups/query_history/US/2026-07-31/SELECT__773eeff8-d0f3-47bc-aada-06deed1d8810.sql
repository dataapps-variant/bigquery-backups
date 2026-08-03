-- job_id: 773eeff8-d0f3-47bc-aada-06deed1d8810
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:14:55.452000+00:00
-- started: 2026-07-31T13:14:55.542000+00:00
-- ended: 2026-07-31T13:14:55.632000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
