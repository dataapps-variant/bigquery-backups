-- job_id: 60c5468f-417b-4a4d-8662-8f98d019aef9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:02.801000+00:00
-- started: 2026-08-03T10:10:02.908000+00:00
-- ended: 2026-08-03T10:10:03.143000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
