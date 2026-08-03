-- job_id: 717485c3-aa96-4b09-ab33-127462a9de63
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:04:49.710000+00:00
-- started: 2026-08-03T09:04:49.803000+00:00
-- ended: 2026-08-03T09:04:49.971000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
