-- job_id: 9be50482-6801-4a88-8c47-73189d976e28
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:09:59.957000+00:00
-- started: 2026-08-03T09:10:00.140000+00:00
-- ended: 2026-08-03T09:10:00.684000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
