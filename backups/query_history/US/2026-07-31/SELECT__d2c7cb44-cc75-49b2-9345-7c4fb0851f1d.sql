-- job_id: d2c7cb44-cc75-49b2-9345-7c4fb0851f1d
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:14:59.468000+00:00
-- started: 2026-07-31T13:14:59.581000+00:00
-- ended: 2026-07-31T13:14:59.678000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
