-- job_id: 086deb52-7f80-4a08-8936-edf757b0c4b9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:14.627000+00:00
-- started: 2026-08-03T11:51:14.766000+00:00
-- ended: 2026-08-03T11:51:15.007000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
