-- job_id: 2414fe6e-6a73-469b-93a1-feac57c9a32b
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:35:35.091000+00:00
-- started: 2026-07-31T16:35:35.172000+00:00
-- ended: 2026-07-31T16:35:35.294000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
