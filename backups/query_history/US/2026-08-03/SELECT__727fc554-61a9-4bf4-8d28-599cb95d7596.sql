-- job_id: 727fc554-61a9-4bf4-8d28-599cb95d7596
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:16.400000+00:00
-- started: 2026-08-03T12:37:16.524000+00:00
-- ended: 2026-08-03T12:37:16.773000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
