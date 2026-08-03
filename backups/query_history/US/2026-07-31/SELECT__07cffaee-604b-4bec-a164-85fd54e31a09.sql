-- job_id: 07cffaee-604b-4bec-a164-85fd54e31a09
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:14:49.042000+00:00
-- started: 2026-07-31T13:14:49.168000+00:00
-- ended: 2026-07-31T13:14:49.279000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
