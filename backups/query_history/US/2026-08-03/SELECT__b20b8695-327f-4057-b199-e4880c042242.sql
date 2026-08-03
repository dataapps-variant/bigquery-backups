-- job_id: b20b8695-327f-4057-b199-e4880c042242
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:48:56.456000+00:00
-- started: 2026-08-03T09:48:56.620000+00:00
-- ended: 2026-08-03T09:48:56.791000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
