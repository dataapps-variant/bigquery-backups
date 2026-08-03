-- job_id: 4f4ae217-8554-4e08-95bd-1420bfa0958a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:23.566000+00:00
-- started: 2026-08-03T09:05:23.670000+00:00
-- ended: 2026-08-03T09:05:23.822000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
