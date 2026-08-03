-- job_id: 3b4998a6-83be-40db-94e4-4e166b50e53a
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:14:13.205000+00:00
-- started: 2026-07-31T13:14:13.290000+00:00
-- ended: 2026-07-31T13:14:13.416000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
