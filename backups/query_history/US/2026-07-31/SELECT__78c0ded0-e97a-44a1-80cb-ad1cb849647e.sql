-- job_id: 78c0ded0-e97a-44a1-80cb-ad1cb849647e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:34:20.350000+00:00
-- started: 2026-07-31T16:34:20.432000+00:00
-- ended: 2026-07-31T16:34:20.542000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
