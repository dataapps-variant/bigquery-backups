-- job_id: d8e7b392-b7f1-435d-a588-2d060798ba81
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:10.973000+00:00
-- started: 2026-08-03T11:52:11.086000+00:00
-- ended: 2026-08-03T11:52:11.330000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
