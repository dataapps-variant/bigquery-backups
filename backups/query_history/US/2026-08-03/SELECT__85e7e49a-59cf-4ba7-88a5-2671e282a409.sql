-- job_id: 85e7e49a-59cf-4ba7-88a5-2671e282a409
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:48:52.974000+00:00
-- started: 2026-08-03T09:48:53.083000+00:00
-- ended: 2026-08-03T09:48:53.359000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
