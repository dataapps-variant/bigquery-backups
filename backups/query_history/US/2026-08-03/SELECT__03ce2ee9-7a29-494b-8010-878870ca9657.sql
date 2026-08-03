-- job_id: 03ce2ee9-7a29-494b-8010-878870ca9657
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:00.578000+00:00
-- started: 2026-08-03T12:38:00.693000+00:00
-- ended: 2026-08-03T12:38:00.969000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
