-- job_id: 71c0535c-2c93-4924-8355-8047da8f9e6c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:39:09.487000+00:00
-- started: 2026-08-03T12:39:09.598000+00:00
-- ended: 2026-08-03T12:39:09.863000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
