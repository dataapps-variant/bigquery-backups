-- job_id: 9392aac0-48c2-4437-9e18-cda26917ba43
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:21:41.156000+00:00
-- started: 2026-07-31T15:21:41.262000+00:00
-- ended: 2026-07-31T15:21:41.347000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
