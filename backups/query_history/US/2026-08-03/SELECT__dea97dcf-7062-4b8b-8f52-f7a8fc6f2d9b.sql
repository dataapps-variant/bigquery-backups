-- job_id: dea97dcf-7062-4b8b-8f52-f7a8fc6f2d9b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:17.872000+00:00
-- started: 2026-08-03T12:38:17.921000+00:00
-- ended: 2026-08-03T12:38:18.089000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
