-- job_id: 70d31a4a-b1c4-434a-b516-edc7eb03a162
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:35:38.900000+00:00
-- started: 2026-07-31T16:35:39.367000+00:00
-- ended: 2026-07-31T16:35:39.486000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
