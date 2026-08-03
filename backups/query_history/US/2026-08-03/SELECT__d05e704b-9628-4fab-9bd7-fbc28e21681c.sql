-- job_id: d05e704b-9628-4fab-9bd7-fbc28e21681c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:41.880000+00:00
-- started: 2026-08-03T09:13:41.976000+00:00
-- ended: 2026-08-03T09:13:42.175000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
