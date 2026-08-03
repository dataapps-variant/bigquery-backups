-- job_id: ba546ce5-9fc6-4401-ba2d-47966e01311d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:31.065000+00:00
-- started: 2026-08-03T12:37:31.146000+00:00
-- ended: 2026-08-03T12:37:31.329000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
