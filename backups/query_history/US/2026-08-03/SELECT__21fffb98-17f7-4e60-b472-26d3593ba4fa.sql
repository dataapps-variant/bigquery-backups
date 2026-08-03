-- job_id: 21fffb98-17f7-4e60-b472-26d3593ba4fa
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:00.907000+00:00
-- started: 2026-08-03T10:10:00.961000+00:00
-- ended: 2026-08-03T10:10:01.144000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
