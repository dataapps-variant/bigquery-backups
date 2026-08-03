-- job_id: 9bac6867-b6c8-43e9-bbf8-2a1e29a95abd
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:26.698000+00:00
-- started: 2026-08-03T09:10:26.812000+00:00
-- ended: 2026-08-03T09:10:26.994000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
