-- job_id: a4ccb294-7cbe-496a-9108-8cf01b9f238b
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:32:55.918000+00:00
-- started: 2026-07-31T16:32:56.045000+00:00
-- ended: 2026-07-31T16:32:56.165000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
