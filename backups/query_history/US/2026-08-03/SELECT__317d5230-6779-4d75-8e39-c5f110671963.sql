-- job_id: 317d5230-6779-4d75-8e39-c5f110671963
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:25.352000+00:00
-- started: 2026-08-03T12:30:25.466000+00:00
-- ended: 2026-08-03T12:30:25.697000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
