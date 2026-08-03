-- job_id: 71db0d08-4859-4b4d-8e33-cd4ea6e331ed
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:08.160000+00:00
-- started: 2026-08-03T09:32:08.285000+00:00
-- ended: 2026-08-03T09:32:08.444000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
