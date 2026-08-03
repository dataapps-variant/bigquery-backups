-- job_id: 39fcb0db-e647-4434-ac04-58c17211a49c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:08.295000+00:00
-- started: 2026-08-03T10:10:08.355000+00:00
-- ended: 2026-08-03T10:10:08.572000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
