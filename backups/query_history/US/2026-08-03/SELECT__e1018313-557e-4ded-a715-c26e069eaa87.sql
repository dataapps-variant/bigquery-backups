-- job_id: e1018313-557e-4ded-a715-c26e069eaa87
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:48:51.335000+00:00
-- started: 2026-08-03T09:48:51.467000+00:00
-- ended: 2026-08-03T09:48:51.692000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
