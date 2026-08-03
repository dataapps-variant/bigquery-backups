-- job_id: 22646b09-5d65-464e-999a-2aed8adfc256
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:29.724000+00:00
-- started: 2026-08-03T10:10:29.802000+00:00
-- ended: 2026-08-03T10:10:30.125000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
