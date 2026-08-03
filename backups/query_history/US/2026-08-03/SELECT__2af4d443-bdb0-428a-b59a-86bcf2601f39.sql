-- job_id: 2af4d443-bdb0-428a-b59a-86bcf2601f39
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:31.444000+00:00
-- started: 2026-08-03T09:10:31.523000+00:00
-- ended: 2026-08-03T09:10:31.726000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
