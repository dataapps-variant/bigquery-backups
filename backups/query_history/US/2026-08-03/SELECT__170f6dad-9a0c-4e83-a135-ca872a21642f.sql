-- job_id: 170f6dad-9a0c-4e83-a135-ca872a21642f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:27.915000+00:00
-- started: 2026-08-03T11:53:28.045000+00:00
-- ended: 2026-08-03T11:53:28.269000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
