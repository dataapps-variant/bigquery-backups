-- job_id: bd76d7cd-0d00-46f2-9a9e-2f777a857f7a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:43.716000+00:00
-- started: 2026-08-03T10:10:43.809000+00:00
-- ended: 2026-08-03T10:10:44.025000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
