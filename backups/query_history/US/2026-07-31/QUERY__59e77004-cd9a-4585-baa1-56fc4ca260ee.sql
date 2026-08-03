-- job_id: 59e77004-cd9a-4585-baa1-56fc4ca260ee
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: None
-- created: 2026-07-31T12:33:37.248000+00:00
-- started: 2026-07-31T12:33:37.641000+00:00
-- ended: 2026-07-31T12:33:37.641000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
