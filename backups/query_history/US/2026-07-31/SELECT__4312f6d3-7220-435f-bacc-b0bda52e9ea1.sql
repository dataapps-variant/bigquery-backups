-- job_id: 4312f6d3-7220-435f-bacc-b0bda52e9ea1
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:50.562000+00:00
-- started: 2026-07-31T12:50:50.638000+00:00
-- ended: 2026-07-31T12:50:50.761000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
