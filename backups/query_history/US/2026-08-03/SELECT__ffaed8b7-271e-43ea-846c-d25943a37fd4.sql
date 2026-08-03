-- job_id: ffaed8b7-271e-43ea-846c-d25943a37fd4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:50.581000+00:00
-- started: 2026-08-03T09:12:50.695000+00:00
-- ended: 2026-08-03T09:12:50.872000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
