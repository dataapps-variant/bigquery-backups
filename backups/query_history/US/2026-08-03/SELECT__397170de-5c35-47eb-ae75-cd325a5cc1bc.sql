-- job_id: 397170de-5c35-47eb-ae75-cd325a5cc1bc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:19.264000+00:00
-- started: 2026-08-03T09:13:19.397000+00:00
-- ended: 2026-08-03T09:13:19.578000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
