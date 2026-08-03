-- job_id: 906aa8dd-5a05-4c6e-b928-fa5b7254eb23
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:09:49.976000+00:00
-- started: 2026-08-03T09:09:50.087000+00:00
-- ended: 2026-08-03T09:09:50.291000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
