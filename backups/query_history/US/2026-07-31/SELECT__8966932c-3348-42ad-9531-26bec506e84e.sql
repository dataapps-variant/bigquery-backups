-- job_id: 8966932c-3348-42ad-9531-26bec506e84e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:34:24.008000+00:00
-- started: 2026-07-31T16:34:24.085000+00:00
-- ended: 2026-07-31T16:34:24.197000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
