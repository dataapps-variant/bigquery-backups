-- job_id: 39461316-413f-474f-9b4f-fbb8799eb23c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:32:50.106000+00:00
-- started: 2026-07-31T16:32:50.208000+00:00
-- ended: 2026-07-31T16:32:50.297000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
