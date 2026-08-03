-- job_id: 307542be-7daf-4a19-8386-00a9a720d2c3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:08.774000+00:00
-- started: 2026-08-03T12:38:08.854000+00:00
-- ended: 2026-08-03T12:38:09.051000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
