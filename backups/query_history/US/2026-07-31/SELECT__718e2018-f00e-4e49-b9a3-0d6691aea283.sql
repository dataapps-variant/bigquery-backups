-- job_id: 718e2018-f00e-4e49-b9a3-0d6691aea283
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:27:17.755000+00:00
-- started: 2026-07-31T13:27:17.874000+00:00
-- ended: 2026-07-31T13:27:18.025000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
