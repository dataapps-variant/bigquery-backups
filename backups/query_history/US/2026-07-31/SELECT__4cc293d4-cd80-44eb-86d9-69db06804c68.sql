-- job_id: 4cc293d4-cd80-44eb-86d9-69db06804c68
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:14:09.190000+00:00
-- started: 2026-07-31T13:14:09.285000+00:00
-- ended: 2026-07-31T13:14:09.405000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
