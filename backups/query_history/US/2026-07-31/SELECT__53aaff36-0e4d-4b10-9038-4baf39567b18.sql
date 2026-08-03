-- job_id: 53aaff36-0e4d-4b10-9038-4baf39567b18
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:05.384000+00:00
-- started: 2026-07-31T12:50:05.484000+00:00
-- ended: 2026-07-31T12:50:05.594000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
