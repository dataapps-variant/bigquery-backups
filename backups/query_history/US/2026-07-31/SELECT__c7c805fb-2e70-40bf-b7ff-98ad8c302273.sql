-- job_id: c7c805fb-2e70-40bf-b7ff-98ad8c302273
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:14:07.084000+00:00
-- started: 2026-07-31T13:14:07.168000+00:00
-- ended: 2026-07-31T13:14:07.273000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
