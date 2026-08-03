-- job_id: bbffe912-4de2-4cae-80ca-a5e2849996be
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:50:57.868000+00:00
-- started: 2026-08-03T11:50:58.010000+00:00
-- ended: 2026-08-03T11:50:58.280000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
