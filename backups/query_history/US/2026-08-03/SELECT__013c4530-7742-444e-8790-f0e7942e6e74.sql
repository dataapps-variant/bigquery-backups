-- job_id: 013c4530-7742-444e-8790-f0e7942e6e74
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:04:06.563000+00:00
-- started: 2026-08-03T13:04:06.659000+00:00
-- ended: 2026-08-03T13:04:06.831000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
