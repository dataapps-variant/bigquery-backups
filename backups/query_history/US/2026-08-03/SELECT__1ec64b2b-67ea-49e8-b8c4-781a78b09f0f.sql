-- job_id: 1ec64b2b-67ea-49e8-b8c4-781a78b09f0f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:24.663000+00:00
-- started: 2026-08-03T10:09:24.766000+00:00
-- ended: 2026-08-03T10:09:25.339000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
