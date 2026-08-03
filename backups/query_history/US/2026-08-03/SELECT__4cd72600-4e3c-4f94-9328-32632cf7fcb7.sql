-- job_id: 4cd72600-4e3c-4f94-9328-32632cf7fcb7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:26.514000+00:00
-- started: 2026-08-03T10:10:26.603000+00:00
-- ended: 2026-08-03T10:10:26.845000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
