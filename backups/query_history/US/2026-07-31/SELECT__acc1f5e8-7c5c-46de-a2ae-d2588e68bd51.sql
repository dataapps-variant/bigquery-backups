-- job_id: acc1f5e8-7c5c-46de-a2ae-d2588e68bd51
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:03.051000+00:00
-- started: 2026-07-31T12:50:03.122000+00:00
-- ended: 2026-07-31T12:50:03.195000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
