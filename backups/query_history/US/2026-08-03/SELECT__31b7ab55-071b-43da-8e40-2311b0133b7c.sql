-- job_id: 31b7ab55-071b-43da-8e40-2311b0133b7c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:30.706000+00:00
-- started: 2026-08-03T12:29:30.787000+00:00
-- ended: 2026-08-03T12:29:30.963000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
