-- job_id: 759e09b5-70b5-4028-b727-1e2f88f668f5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:51.209000+00:00
-- started: 2026-08-03T10:10:51.284000+00:00
-- ended: 2026-08-03T10:10:51.498000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
