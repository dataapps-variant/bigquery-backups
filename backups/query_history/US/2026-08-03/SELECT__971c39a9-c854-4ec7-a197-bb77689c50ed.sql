-- job_id: 971c39a9-c854-4ec7-a197-bb77689c50ed
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:16.315000+00:00
-- started: 2026-08-03T11:51:16.444000+00:00
-- ended: 2026-08-03T11:51:16.655000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
