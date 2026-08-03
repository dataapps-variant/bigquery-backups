-- job_id: 8ec56574-02df-4b89-bdfb-3ff8751190b7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:48.395000+00:00
-- started: 2026-08-03T12:29:48.481000+00:00
-- ended: 2026-08-03T12:29:48.724000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
