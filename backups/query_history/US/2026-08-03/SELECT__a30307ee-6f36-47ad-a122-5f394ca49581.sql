-- job_id: a30307ee-6f36-47ad-a122-5f394ca49581
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:49.923000+00:00
-- started: 2026-08-03T12:37:50.001000+00:00
-- ended: 2026-08-03T12:37:50.189000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
