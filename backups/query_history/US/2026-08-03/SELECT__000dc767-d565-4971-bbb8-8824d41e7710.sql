-- job_id: 000dc767-d565-4971-bbb8-8824d41e7710
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:07.971000+00:00
-- started: 2026-08-03T10:10:08.045000+00:00
-- ended: 2026-08-03T10:10:08.211000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
