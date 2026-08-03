-- job_id: c429a6bf-a9a4-411d-9e5f-78ade845f895
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:23.842000+00:00
-- started: 2026-08-03T10:09:23.904000+00:00
-- ended: 2026-08-03T10:09:24.078000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
