-- job_id: 5d144266-9be9-46c7-962a-24229a23a45b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:50.020000+00:00
-- started: 2026-08-03T10:08:50.129000+00:00
-- ended: 2026-08-03T10:08:50.339000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
