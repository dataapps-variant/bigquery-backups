-- job_id: 9d4d465c-0936-442a-a7f0-9cd9f0cfe7b1
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:38.266000+00:00
-- started: 2026-07-31T12:50:38.323000+00:00
-- ended: 2026-07-31T12:50:38.412000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
