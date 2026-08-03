-- job_id: 5618ac9d-c7e6-40e2-8498-b7a6040d2d2d
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:49:56.070000+00:00
-- started: 2026-07-31T12:49:56.149000+00:00
-- ended: 2026-07-31T12:49:56.276000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
