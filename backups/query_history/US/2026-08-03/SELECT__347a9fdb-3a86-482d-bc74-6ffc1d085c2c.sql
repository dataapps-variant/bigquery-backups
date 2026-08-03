-- job_id: 347a9fdb-3a86-482d-bc74-6ffc1d085c2c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:22.515000+00:00
-- started: 2026-08-03T10:10:22.600000+00:00
-- ended: 2026-08-03T10:10:22.824000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
