-- job_id: 36dc603b-4111-4377-a817-11508f4dbd3c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:38.787000+00:00
-- started: 2026-08-03T09:12:38.893000+00:00
-- ended: 2026-08-03T09:12:39.558000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
