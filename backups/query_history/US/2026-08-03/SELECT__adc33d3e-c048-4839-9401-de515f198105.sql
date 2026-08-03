-- job_id: adc33d3e-c048-4839-9401-de515f198105
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:38.216000+00:00
-- started: 2026-08-03T10:10:38.328000+00:00
-- ended: 2026-08-03T10:10:38.563000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
