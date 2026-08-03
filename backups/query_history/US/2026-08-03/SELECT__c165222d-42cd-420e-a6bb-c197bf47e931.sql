-- job_id: c165222d-42cd-420e-a6bb-c197bf47e931
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:38.954000+00:00
-- started: 2026-08-03T12:29:39.036000+00:00
-- ended: 2026-08-03T12:29:39.289000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
