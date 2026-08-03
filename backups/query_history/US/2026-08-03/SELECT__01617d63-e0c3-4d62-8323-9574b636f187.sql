-- job_id: 01617d63-e0c3-4d62-8323-9574b636f187
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:39.801000+00:00
-- started: 2026-08-03T10:10:39.904000+00:00
-- ended: 2026-08-03T10:10:40.071000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
