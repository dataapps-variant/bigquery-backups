-- job_id: 25507f51-e893-47f8-8c25-6e2aa67f9f13
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:36:02.540000+00:00
-- started: 2026-07-31T16:36:02.633000+00:00
-- ended: 2026-07-31T16:36:02.743000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
