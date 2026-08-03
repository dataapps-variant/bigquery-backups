-- job_id: 0f3383ac-43d0-44ef-a3a4-138f172e4de5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:16.302000+00:00
-- started: 2026-08-03T13:01:16.411000+00:00
-- ended: 2026-08-03T13:01:16.627000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
