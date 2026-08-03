-- job_id: 3ef41239-517c-40e6-b192-905b74bdfbfb
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:41.968000+00:00
-- started: 2026-07-31T12:50:42.079000+00:00
-- ended: 2026-07-31T12:50:42.196000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
