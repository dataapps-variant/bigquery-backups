-- job_id: f082a74d-e904-41d6-bd78-c73e681000ef
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:09.876000+00:00
-- started: 2026-08-03T12:37:09.986000+00:00
-- ended: 2026-08-03T12:37:10.646000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
