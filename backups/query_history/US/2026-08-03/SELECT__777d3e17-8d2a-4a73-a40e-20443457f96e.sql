-- job_id: 777d3e17-8d2a-4a73-a40e-20443457f96e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:14.870000+00:00
-- started: 2026-08-03T09:05:14.950000+00:00
-- ended: 2026-08-03T09:05:15.146000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
