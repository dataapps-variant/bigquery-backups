-- job_id: 49f85539-821a-4076-8ff8-f8b9b6933d2f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:42.189000+00:00
-- started: 2026-08-03T09:49:42.242000+00:00
-- ended: 2026-08-03T09:49:42.388000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
