-- job_id: b7019ead-98a6-4627-87d6-6467ba9673b5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:22.768000+00:00
-- started: 2026-08-03T13:02:22.821000+00:00
-- ended: 2026-08-03T13:02:23.003000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
