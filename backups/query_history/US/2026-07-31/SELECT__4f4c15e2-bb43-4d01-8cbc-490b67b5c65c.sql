-- job_id: 4f4c15e2-bb43-4d01-8cbc-490b67b5c65c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:17:09.434000+00:00
-- started: 2026-07-31T13:17:09.535000+00:00
-- ended: 2026-07-31T13:17:09.612000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
