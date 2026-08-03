-- job_id: 04d6fd04-be97-409e-a98d-a3deccf2a55e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:17.898000+00:00
-- started: 2026-08-03T12:28:18.007000+00:00
-- ended: 2026-08-03T12:28:18.241000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
