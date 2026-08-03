-- job_id: 3dc94c59-ff97-4f96-8d5e-7f25f1b6161f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:08.491000+00:00
-- started: 2026-08-03T09:10:08.571000+00:00
-- ended: 2026-08-03T09:10:08.731000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
