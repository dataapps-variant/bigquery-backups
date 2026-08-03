-- job_id: 5fd83d84-b1d4-42e3-8368-c6f159d4c023
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:53.693000+00:00
-- started: 2026-08-03T10:08:53.781000+00:00
-- ended: 2026-08-03T10:08:53.958000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
