-- job_id: 63fafe13-98dd-4312-aa54-e5de1b9f8a58
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:08.992000+00:00
-- started: 2026-07-31T12:50:09.064000+00:00
-- ended: 2026-07-31T12:50:09.180000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
