-- job_id: 67bccfd1-3827-43ef-a6a4-cbf29c2b00ee
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:16.480000+00:00
-- started: 2026-08-03T09:10:16.543000+00:00
-- ended: 2026-08-03T09:10:16.707000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
