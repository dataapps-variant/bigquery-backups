-- job_id: 7ce41573-09db-4bfa-9628-f55854cf1835
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:31.491000+00:00
-- started: 2026-08-03T13:01:31.673000+00:00
-- ended: 2026-08-03T13:01:31.873000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
