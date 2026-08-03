-- job_id: 6879a38a-2c96-44e9-90e2-e1c907c14bca
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:13.247000+00:00
-- started: 2026-08-03T09:05:13.336000+00:00
-- ended: 2026-08-03T09:05:13.536000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
