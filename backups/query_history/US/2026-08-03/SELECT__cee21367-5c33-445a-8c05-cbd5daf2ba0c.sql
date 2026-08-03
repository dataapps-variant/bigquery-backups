-- job_id: cee21367-5c33-445a-8c05-cbd5daf2ba0c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:31:29.939000+00:00
-- started: 2026-08-03T09:31:30.944000+00:00
-- ended: 2026-08-03T09:31:31.304000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
