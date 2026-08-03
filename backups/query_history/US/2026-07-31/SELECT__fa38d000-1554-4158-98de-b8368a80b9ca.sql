-- job_id: fa38d000-1554-4158-98de-b8368a80b9ca
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:25.783000+00:00
-- started: 2026-07-31T12:50:25.866000+00:00
-- ended: 2026-07-31T12:50:25.981000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
