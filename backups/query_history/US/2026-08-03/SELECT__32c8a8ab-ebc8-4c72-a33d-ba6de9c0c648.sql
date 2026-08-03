-- job_id: 32c8a8ab-ebc8-4c72-a33d-ba6de9c0c648
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:28.528000+00:00
-- started: 2026-08-03T10:10:28.657000+00:00
-- ended: 2026-08-03T10:10:28.933000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
