-- job_id: 991eb3dc-5b34-4474-8aea-632001286b17
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:20.129000+00:00
-- started: 2026-08-03T11:52:20.228000+00:00
-- ended: 2026-08-03T11:52:20.962000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
