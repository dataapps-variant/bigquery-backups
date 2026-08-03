-- job_id: 3b074f40-ee41-4a74-943f-d7606d64a1e5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:09:51.639000+00:00
-- started: 2026-08-03T09:09:51.738000+00:00
-- ended: 2026-08-03T09:09:51.993000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
