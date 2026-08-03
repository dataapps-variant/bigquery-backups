-- job_id: 8c9232b2-81dd-417e-8ee9-357690d7b2d9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:04.750000+00:00
-- started: 2026-08-03T10:10:04.805000+00:00
-- ended: 2026-08-03T10:10:05.023000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
