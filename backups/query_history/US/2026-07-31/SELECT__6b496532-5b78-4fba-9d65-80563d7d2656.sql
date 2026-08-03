-- job_id: 6b496532-5b78-4fba-9d65-80563d7d2656
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:47.096000+00:00
-- started: 2026-07-31T12:50:47.178000+00:00
-- ended: 2026-07-31T12:50:47.280000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
