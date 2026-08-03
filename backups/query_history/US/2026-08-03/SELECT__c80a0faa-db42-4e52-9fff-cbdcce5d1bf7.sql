-- job_id: c80a0faa-db42-4e52-9fff-cbdcce5d1bf7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:16.445000+00:00
-- started: 2026-08-03T12:28:16.527000+00:00
-- ended: 2026-08-03T12:28:16.730000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
