-- job_id: 025042b9-35ad-4c58-8fea-186b5887157a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:51.728000+00:00
-- started: 2026-08-03T10:08:51.874000+00:00
-- ended: 2026-08-03T10:08:52.148000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
