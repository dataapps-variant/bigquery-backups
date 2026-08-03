-- job_id: 245f4878-0a17-439d-aac2-0f9e5e7642c9
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:16:58.755000+00:00
-- started: 2026-07-31T13:16:58.821000+00:00
-- ended: 2026-07-31T13:16:58.945000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
