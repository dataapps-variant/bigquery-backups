-- job_id: cb50c9cd-ca8d-4e39-b28a-7fb275bf2ce4
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:32:28.562000+00:00
-- started: 2026-07-31T16:32:28.639000+00:00
-- ended: 2026-07-31T16:32:28.717000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
