-- job_id: 7f8dc148-a2dd-441d-ad91-ec7cae602f2d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:51:09.336000+00:00
-- started: 2026-08-03T09:51:09.452000+00:00
-- ended: 2026-08-03T09:51:09.690000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
