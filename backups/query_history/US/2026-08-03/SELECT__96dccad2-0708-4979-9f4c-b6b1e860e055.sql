-- job_id: 96dccad2-0708-4979-9f4c-b6b1e860e055
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:03.436000+00:00
-- started: 2026-08-03T12:38:03.515000+00:00
-- ended: 2026-08-03T12:38:03.621000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
