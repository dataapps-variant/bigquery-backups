-- job_id: 8eb59f1d-f7a6-422a-85ba-eeaf30ad146d
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:50:33.349000+00:00
-- started: 2026-07-31T12:50:33.418000+00:00
-- ended: 2026-07-31T12:50:33.524000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
