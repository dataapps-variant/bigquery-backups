-- job_id: 773d0500-55ca-47db-9d01-a42d748fa6bd
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:13.773000+00:00
-- started: 2026-08-03T10:11:13.868000+00:00
-- ended: 2026-08-03T10:11:14.092000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
