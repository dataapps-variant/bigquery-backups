-- job_id: 0afbd942-f183-4e95-8e23-c4442613b3b0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:40.110000+00:00
-- started: 2026-08-03T12:37:40.203000+00:00
-- ended: 2026-08-03T12:37:40.423000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
