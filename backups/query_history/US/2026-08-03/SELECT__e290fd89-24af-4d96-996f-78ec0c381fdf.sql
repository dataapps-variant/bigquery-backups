-- job_id: e290fd89-24af-4d96-996f-78ec0c381fdf
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:27.148000+00:00
-- started: 2026-08-03T10:09:27.240000+00:00
-- ended: 2026-08-03T10:09:27.802000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
