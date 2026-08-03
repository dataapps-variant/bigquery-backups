-- job_id: 3c307390-017b-44c7-acc8-b91ef3952232
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:11.345000+00:00
-- started: 2026-08-03T09:13:11.465000+00:00
-- ended: 2026-08-03T09:13:11.662000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
