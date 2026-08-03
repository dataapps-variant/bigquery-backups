-- job_id: 0cc2edf7-81bc-4335-912b-52550fe58461
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:41.522000+00:00
-- started: 2026-08-03T10:11:41.582000+00:00
-- ended: 2026-08-03T10:11:41.766000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
