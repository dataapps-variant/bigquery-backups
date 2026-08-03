-- job_id: f638280b-9cbb-478d-b23a-5f4bb4a63015
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:30.676000+00:00
-- started: 2026-08-03T12:36:30.785000+00:00
-- ended: 2026-08-03T12:36:31.033000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
