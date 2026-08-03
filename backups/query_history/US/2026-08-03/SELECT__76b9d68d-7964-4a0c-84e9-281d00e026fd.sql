-- job_id: 76b9d68d-7964-4a0c-84e9-281d00e026fd
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:09:53.253000+00:00
-- started: 2026-08-03T09:09:53.369000+00:00
-- ended: 2026-08-03T09:09:53.534000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
