-- job_id: 7249279c-5755-4cbd-bdf4-a5d8a0b1b20a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:29.389000+00:00
-- started: 2026-08-03T13:01:29.493000+00:00
-- ended: 2026-08-03T13:01:29.767000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
