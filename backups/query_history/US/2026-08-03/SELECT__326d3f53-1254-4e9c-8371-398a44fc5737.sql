-- job_id: 326d3f53-1254-4e9c-8371-398a44fc5737
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:59.165000+00:00
-- started: 2026-08-03T10:08:59.273000+00:00
-- ended: 2026-08-03T10:08:59.456000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
