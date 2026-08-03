-- job_id: 17445bbc-9b8c-478e-bd96-8b7871148a00
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:40.365000+00:00
-- started: 2026-08-03T13:03:40.448000+00:00
-- ended: 2026-08-03T13:03:40.676000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
