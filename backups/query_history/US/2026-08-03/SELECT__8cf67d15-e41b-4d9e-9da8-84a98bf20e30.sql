-- job_id: 8cf67d15-e41b-4d9e-9da8-84a98bf20e30
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:26.015000+00:00
-- started: 2026-08-03T13:02:26.086000+00:00
-- ended: 2026-08-03T13:02:26.296000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
