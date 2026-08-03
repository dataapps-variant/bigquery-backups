-- job_id: ff8d5674-a450-48cb-bfd2-07d03411c622
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:00.064000+00:00
-- started: 2026-08-03T13:02:00.150000+00:00
-- ended: 2026-08-03T13:02:00.667000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
