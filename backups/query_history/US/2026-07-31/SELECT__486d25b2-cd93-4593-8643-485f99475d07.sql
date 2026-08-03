-- job_id: 486d25b2-cd93-4593-8643-485f99475d07
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:22.284000+00:00
-- started: 2026-07-31T12:50:22.399000+00:00
-- ended: 2026-07-31T12:50:22.513000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
