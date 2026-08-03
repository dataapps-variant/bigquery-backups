-- job_id: 1a9b6af0-da2f-4e1c-bbc7-410a4ec2c816
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:32:54.203000+00:00
-- started: 2026-07-31T16:32:54.299000+00:00
-- ended: 2026-07-31T16:32:54.413000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
