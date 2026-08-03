-- job_id: a5b31750-a1bc-412c-a30a-54c822e9b900
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:17:05.482000+00:00
-- started: 2026-07-31T13:17:05.558000+00:00
-- ended: 2026-07-31T13:17:05.669000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
