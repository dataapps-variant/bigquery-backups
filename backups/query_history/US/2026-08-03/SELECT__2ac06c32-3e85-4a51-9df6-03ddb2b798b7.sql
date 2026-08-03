-- job_id: 2ac06c32-3e85-4a51-9df6-03ddb2b798b7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:09.050000+00:00
-- started: 2026-08-03T13:02:09.175000+00:00
-- ended: 2026-08-03T13:02:09.385000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
