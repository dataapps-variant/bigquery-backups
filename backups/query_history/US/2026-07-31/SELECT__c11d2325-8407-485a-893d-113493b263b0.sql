-- job_id: c11d2325-8407-485a-893d-113493b263b0
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:17:51.511000+00:00
-- started: 2026-07-31T15:17:51.586000+00:00
-- ended: 2026-07-31T15:17:51.688000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
