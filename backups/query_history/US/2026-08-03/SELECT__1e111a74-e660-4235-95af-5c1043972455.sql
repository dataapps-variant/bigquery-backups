-- job_id: 1e111a74-e660-4235-95af-5c1043972455
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:07.193000+00:00
-- started: 2026-08-03T12:38:07.258000+00:00
-- ended: 2026-08-03T12:38:07.335000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
