-- job_id: c398167b-a2da-46b6-af7b-889cf962e116
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:28.489000+00:00
-- started: 2026-08-03T10:11:28.555000+00:00
-- ended: 2026-08-03T10:11:28.771000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
