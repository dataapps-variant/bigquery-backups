-- job_id: 8954d6e3-d9fc-4c87-bef7-9af8b75ee747
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:32:25.065000+00:00
-- started: 2026-07-31T16:32:25.159000+00:00
-- ended: 2026-07-31T16:32:25.286000+00:00


        SELECT DISTINCT report_date
        FROM `variant-finance-data-project.CWC.Weekly_Insights`
        WHERE report_date IS NOT NULL
        ORDER BY report_date DESC
        LIMIT @limit
