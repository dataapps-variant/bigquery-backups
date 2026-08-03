-- job_id: 311bfbde-0eca-46bd-beb3-92f7cd431fae
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:01.695000+00:00
-- started: 2026-08-03T12:38:01.768000+00:00
-- ended: 2026-08-03T12:38:01.887000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
