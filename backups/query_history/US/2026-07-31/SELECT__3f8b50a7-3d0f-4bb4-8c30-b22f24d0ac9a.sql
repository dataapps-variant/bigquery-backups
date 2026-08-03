-- job_id: 3f8b50a7-3d0f-4bb4-8c30-b22f24d0ac9a
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:20:48.877000+00:00
-- started: 2026-07-31T15:20:49.064000+00:00
-- ended: 2026-07-31T15:20:49.165000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
