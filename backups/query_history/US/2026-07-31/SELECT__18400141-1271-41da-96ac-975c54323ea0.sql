-- job_id: 18400141-1271-41da-96ac-975c54323ea0
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:27:28.373000+00:00
-- started: 2026-07-31T13:27:28.775000+00:00
-- ended: 2026-07-31T13:27:28.861000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
