-- job_id: 2ff76545-0f06-4f8e-bdd7-e99416bdb4dc
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:14:53.719000+00:00
-- started: 2026-07-31T13:14:53.814000+00:00
-- ended: 2026-07-31T13:14:53.916000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
