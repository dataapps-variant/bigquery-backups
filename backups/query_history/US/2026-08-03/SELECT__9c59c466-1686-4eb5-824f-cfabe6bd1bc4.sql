-- job_id: 9c59c466-1686-4eb5-824f-cfabe6bd1bc4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:37.305000+00:00
-- started: 2026-08-03T09:05:37.428000+00:00
-- ended: 2026-08-03T09:05:37.586000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
