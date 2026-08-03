-- job_id: 5f58ed62-98a6-4f98-b22c-909b4873fdc0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:19.142000+00:00
-- started: 2026-08-03T10:10:19.187000+00:00
-- ended: 2026-08-03T10:10:19.382000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
