-- job_id: ffb1c027-2555-48ff-a7a7-c58245a8d105
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:07.921000+00:00
-- started: 2026-08-03T10:09:08.030000+00:00
-- ended: 2026-08-03T10:09:08.261000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
