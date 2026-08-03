-- job_id: bfea29d2-a408-480c-8dcf-67df7f2b39b7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:24.834000+00:00
-- started: 2026-08-03T09:12:24.938000+00:00
-- ended: 2026-08-03T09:12:25.131000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
