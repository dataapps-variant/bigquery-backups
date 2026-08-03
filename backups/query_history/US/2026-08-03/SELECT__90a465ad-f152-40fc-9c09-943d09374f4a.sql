-- job_id: 90a465ad-f152-40fc-9c09-943d09374f4a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:41.080000+00:00
-- started: 2026-08-03T11:51:41.168000+00:00
-- ended: 2026-08-03T11:51:41.438000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
