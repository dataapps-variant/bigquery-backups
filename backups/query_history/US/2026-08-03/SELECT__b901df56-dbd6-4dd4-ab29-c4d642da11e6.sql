-- job_id: b901df56-dbd6-4dd4-ab29-c4d642da11e6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:02.008000+00:00
-- started: 2026-08-03T13:02:02.130000+00:00
-- ended: 2026-08-03T13:02:02.317000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
