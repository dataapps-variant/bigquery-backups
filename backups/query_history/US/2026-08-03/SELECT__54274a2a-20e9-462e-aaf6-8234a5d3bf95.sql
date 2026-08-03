-- job_id: 54274a2a-20e9-462e-aaf6-8234a5d3bf95
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:47.410000+00:00
-- started: 2026-08-03T12:36:47.527000+00:00
-- ended: 2026-08-03T12:36:47.768000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
