-- job_id: 4e08e0d2-0da2-42e6-b1a0-9b2fb1321eef
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:34:14.220000+00:00
-- started: 2026-07-31T16:34:14.360000+00:00
-- ended: 2026-07-31T16:34:14.459000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
