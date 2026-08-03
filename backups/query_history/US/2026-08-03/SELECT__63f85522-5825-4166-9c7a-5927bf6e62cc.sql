-- job_id: 63f85522-5825-4166-9c7a-5927bf6e62cc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:29.775000+00:00
-- started: 2026-08-03T09:10:29.863000+00:00
-- ended: 2026-08-03T09:10:30.036000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
