-- job_id: 1681a758-8fa4-4ab0-b4d5-86ab03fe2732
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:33.331000+00:00
-- started: 2026-07-31T12:50:33.409000+00:00
-- ended: 2026-07-31T12:50:33.494000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
