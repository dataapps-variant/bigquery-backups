-- job_id: b13f31d6-5711-4fbc-9d4e-298a77df1301
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:18.505000+00:00
-- started: 2026-08-03T11:52:18.610000+00:00
-- ended: 2026-08-03T11:52:18.875000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
