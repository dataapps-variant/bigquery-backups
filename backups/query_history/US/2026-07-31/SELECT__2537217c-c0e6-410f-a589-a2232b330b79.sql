-- job_id: 2537217c-c0e6-410f-a589-a2232b330b79
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:34:32.709000+00:00
-- started: 2026-07-31T16:34:32.801000+00:00
-- ended: 2026-07-31T16:34:32.891000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
