-- job_id: d6d61083-14ad-44dd-98da-a0a5e615c799
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:22.940000+00:00
-- started: 2026-08-03T09:32:23.046000+00:00
-- ended: 2026-08-03T09:32:23.290000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
