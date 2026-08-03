-- job_id: ad20aed5-7f08-419d-b1b4-de4f42f3d8f2
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:45.372000+00:00
-- started: 2026-07-31T12:50:45.461000+00:00
-- ended: 2026-07-31T12:50:45.568000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
