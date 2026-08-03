-- job_id: 5391c002-9d7c-4bae-b262-1bfa6a3afecc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:13.127000+00:00
-- started: 2026-08-03T12:37:13.201000+00:00
-- ended: 2026-08-03T12:37:13.427000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
