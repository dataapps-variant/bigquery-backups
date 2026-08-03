-- job_id: 52c9df54-c03e-43af-951f-f2014c1e5f49
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:39.735000+00:00
-- started: 2026-08-03T10:11:39.810000+00:00
-- ended: 2026-08-03T10:11:39.969000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
