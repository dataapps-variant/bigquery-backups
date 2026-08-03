-- job_id: 16edb5a2-9c54-4689-be1c-8a7648f16468
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:39.905000+00:00
-- started: 2026-08-03T09:10:40.008000+00:00
-- ended: 2026-08-03T09:10:40.188000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
