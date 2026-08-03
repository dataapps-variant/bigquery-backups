-- job_id: 09b72b5e-efd2-4df8-b780-4365718e4f56
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:24.783000+00:00
-- started: 2026-08-03T12:37:24.874000+00:00
-- ended: 2026-08-03T12:37:25.021000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
