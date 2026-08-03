-- job_id: 92f74928-37af-4710-9f70-e58f94b0d326
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:06.490000+00:00
-- started: 2026-08-03T10:10:06.605000+00:00
-- ended: 2026-08-03T10:10:06.868000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
