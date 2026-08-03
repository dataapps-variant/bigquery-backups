-- job_id: db3eb54d-7bdc-4489-9594-f5d310bcb69c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:09.762000+00:00
-- started: 2026-08-03T12:28:09.817000+00:00
-- ended: 2026-08-03T12:28:10.063000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
