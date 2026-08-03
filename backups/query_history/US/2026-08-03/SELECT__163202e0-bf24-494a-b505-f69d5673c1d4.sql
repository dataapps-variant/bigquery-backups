-- job_id: 163202e0-bf24-494a-b505-f69d5673c1d4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:10.583000+00:00
-- started: 2026-08-03T13:01:10.735000+00:00
-- ended: 2026-08-03T13:01:11.106000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
