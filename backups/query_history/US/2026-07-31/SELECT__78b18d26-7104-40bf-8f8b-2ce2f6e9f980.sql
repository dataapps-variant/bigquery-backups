-- job_id: 78b18d26-7104-40bf-8f8b-2ce2f6e9f980
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:29.778000+00:00
-- started: 2026-07-31T12:50:29.865000+00:00
-- ended: 2026-07-31T12:50:29.984000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
