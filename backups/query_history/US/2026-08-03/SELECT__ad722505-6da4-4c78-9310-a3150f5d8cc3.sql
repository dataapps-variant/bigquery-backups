-- job_id: ad722505-6da4-4c78-9310-a3150f5d8cc3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:25.965000+00:00
-- started: 2026-08-03T09:49:26.049000+00:00
-- ended: 2026-08-03T09:49:26.217000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
