-- job_id: 3b8c7709-875f-488a-bbf2-02f22c73e07e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:46.749000+00:00
-- started: 2026-08-03T10:10:46.794000+00:00
-- ended: 2026-08-03T10:10:46.972000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
