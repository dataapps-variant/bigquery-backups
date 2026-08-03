-- job_id: de846d57-5b90-41bd-807d-81eb65d634fb
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:42.246000+00:00
-- started: 2026-08-03T09:05:42.368000+00:00
-- ended: 2026-08-03T09:05:42.552000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
