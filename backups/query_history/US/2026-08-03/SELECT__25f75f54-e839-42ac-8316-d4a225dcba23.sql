-- job_id: 25f75f54-e839-42ac-8316-d4a225dcba23
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:36.303000+00:00
-- started: 2026-08-03T10:10:36.364000+00:00
-- ended: 2026-08-03T10:10:36.546000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
