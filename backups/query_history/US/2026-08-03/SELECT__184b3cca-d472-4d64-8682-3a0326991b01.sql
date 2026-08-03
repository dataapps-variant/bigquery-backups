-- job_id: 184b3cca-d472-4d64-8682-3a0326991b01
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:07.220000+00:00
-- started: 2026-08-03T13:02:07.347000+00:00
-- ended: 2026-08-03T13:02:07.687000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
