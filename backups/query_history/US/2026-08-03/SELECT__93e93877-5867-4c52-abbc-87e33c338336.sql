-- job_id: 93e93877-5867-4c52-abbc-87e33c338336
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:14.724000+00:00
-- started: 2026-08-03T09:13:14.809000+00:00
-- ended: 2026-08-03T09:13:14.990000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
