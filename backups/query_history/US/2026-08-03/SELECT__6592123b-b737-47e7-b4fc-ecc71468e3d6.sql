-- job_id: 6592123b-b737-47e7-b4fc-ecc71468e3d6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:00.879000+00:00
-- started: 2026-08-03T12:28:01.023000+00:00
-- ended: 2026-08-03T12:28:01.278000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
