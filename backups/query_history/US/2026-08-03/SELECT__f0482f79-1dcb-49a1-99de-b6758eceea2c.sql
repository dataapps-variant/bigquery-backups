-- job_id: f0482f79-1dcb-49a1-99de-b6758eceea2c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:34.755000+00:00
-- started: 2026-08-03T09:10:34.876000+00:00
-- ended: 2026-08-03T09:10:35.074000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
