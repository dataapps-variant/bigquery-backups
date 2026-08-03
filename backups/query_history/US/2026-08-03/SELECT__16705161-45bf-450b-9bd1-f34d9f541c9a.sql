-- job_id: 16705161-45bf-450b-9bd1-f34d9f541c9a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:07.604000+00:00
-- started: 2026-08-03T11:52:07.729000+00:00
-- ended: 2026-08-03T11:52:07.954000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
