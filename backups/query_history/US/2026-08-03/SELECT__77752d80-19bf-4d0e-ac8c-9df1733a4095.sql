-- job_id: 77752d80-19bf-4d0e-ac8c-9df1733a4095
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:52.341000+00:00
-- started: 2026-08-03T12:36:52.415000+00:00
-- ended: 2026-08-03T12:36:52.599000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
