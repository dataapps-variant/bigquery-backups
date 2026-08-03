-- job_id: 941de2c5-8d45-4b1f-9546-fab08ddc05e6
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:06.651000+00:00
-- started: 2026-07-31T12:50:06.751000+00:00
-- ended: 2026-07-31T12:50:06.834000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
