-- job_id: d069a278-cdd9-49ba-afcb-7c0d705841b9
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:32:59.985000+00:00
-- started: 2026-07-31T16:33:00.075000+00:00
-- ended: 2026-07-31T16:33:00.189000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
