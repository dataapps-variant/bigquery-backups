-- job_id: 186b586b-9929-4663-a448-26dff266bcab
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:23.544000+00:00
-- started: 2026-08-03T11:53:23.602000+00:00
-- ended: 2026-08-03T11:53:24.533000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
