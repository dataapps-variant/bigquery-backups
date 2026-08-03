-- job_id: f4a42a0d-43ce-4eb2-88f9-917127fd15a7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:19.676000+00:00
-- started: 2026-08-03T10:11:19.782000+00:00
-- ended: 2026-08-03T10:11:20.012000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
