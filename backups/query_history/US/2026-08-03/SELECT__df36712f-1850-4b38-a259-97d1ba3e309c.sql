-- job_id: df36712f-1850-4b38-a259-97d1ba3e309c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:54.392000+00:00
-- started: 2026-08-03T12:37:54.489000+00:00
-- ended: 2026-08-03T12:37:54.719000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
