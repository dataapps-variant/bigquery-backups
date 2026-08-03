-- job_id: 1e0a80eb-6df4-4860-bb5f-a3c0de4a9fab
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:33.460000+00:00
-- started: 2026-08-03T11:52:33.534000+00:00
-- ended: 2026-08-03T11:52:33.757000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
