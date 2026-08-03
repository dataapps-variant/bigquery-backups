-- job_id: a5bae6eb-7215-47fa-b944-81c877925265
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:36:08.200000+00:00
-- started: 2026-07-31T16:36:08.285000+00:00
-- ended: 2026-07-31T16:36:08.368000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
