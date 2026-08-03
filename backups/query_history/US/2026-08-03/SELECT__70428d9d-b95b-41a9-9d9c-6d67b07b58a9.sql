-- job_id: 70428d9d-b95b-41a9-9d9c-6d67b07b58a9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:03.280000+00:00
-- started: 2026-08-03T09:32:03.391000+00:00
-- ended: 2026-08-03T09:32:03.601000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
