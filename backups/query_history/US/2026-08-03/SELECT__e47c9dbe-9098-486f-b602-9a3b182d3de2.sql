-- job_id: e47c9dbe-9098-486f-b602-9a3b182d3de2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:57.091000+00:00
-- started: 2026-08-03T10:08:57.193000+00:00
-- ended: 2026-08-03T10:08:57.360000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
