-- job_id: 3667b206-7119-4814-ac76-88a06e4f9fc9
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:17:45.634000+00:00
-- started: 2026-07-31T15:17:45.750000+00:00
-- ended: 2026-07-31T15:17:45.864000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
