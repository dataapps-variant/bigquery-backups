-- job_id: cb547d61-0ded-4b32-a598-66ec468caa86
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:46.816000+00:00
-- started: 2026-08-03T12:29:46.927000+00:00
-- ended: 2026-08-03T12:29:47.154000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
