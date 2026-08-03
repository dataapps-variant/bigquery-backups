-- job_id: 5233f630-87ec-4842-b610-f60e5e8a50ab
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:35.425000+00:00
-- started: 2026-08-03T12:29:35.511000+00:00
-- ended: 2026-08-03T12:29:35.729000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
