-- job_id: 79e36e00-6f0e-4f0a-8dc9-215004afa087
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:34:22.273000+00:00
-- started: 2026-07-31T16:34:22.342000+00:00
-- ended: 2026-07-31T16:34:22.459000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
