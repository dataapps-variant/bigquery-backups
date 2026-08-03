-- job_id: cbbf2711-1bce-4bcc-a47a-58abbadffb33
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:11:08.869000+00:00
-- started: 2026-08-03T09:11:08.976000+00:00
-- ended: 2026-08-03T09:11:09.180000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
