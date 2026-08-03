-- job_id: 0ce266f5-f67c-477b-8316-411b7d9732a9
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:21:30.858000+00:00
-- started: 2026-07-31T15:21:30.938000+00:00
-- ended: 2026-07-31T15:21:31.060000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
