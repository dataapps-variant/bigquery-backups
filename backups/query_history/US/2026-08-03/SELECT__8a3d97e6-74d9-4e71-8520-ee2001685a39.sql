-- job_id: 8a3d97e6-74d9-4e71-8520-ee2001685a39
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:33.178000+00:00
-- started: 2026-08-03T11:51:33.263000+00:00
-- ended: 2026-08-03T11:51:33.850000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
