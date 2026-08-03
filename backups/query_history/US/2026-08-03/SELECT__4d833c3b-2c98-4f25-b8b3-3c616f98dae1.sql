-- job_id: 4d833c3b-2c98-4f25-b8b3-3c616f98dae1
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:09:56.458000+00:00
-- started: 2026-08-03T09:09:56.595000+00:00
-- ended: 2026-08-03T09:09:56.786000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
