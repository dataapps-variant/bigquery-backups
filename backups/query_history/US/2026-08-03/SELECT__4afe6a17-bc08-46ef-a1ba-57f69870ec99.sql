-- job_id: 4afe6a17-bc08-46ef-a1ba-57f69870ec99
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:04:03.452000+00:00
-- started: 2026-08-03T13:04:03.526000+00:00
-- ended: 2026-08-03T13:04:03.718000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
