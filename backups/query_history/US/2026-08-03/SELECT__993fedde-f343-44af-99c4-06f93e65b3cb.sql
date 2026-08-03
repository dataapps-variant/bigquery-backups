-- job_id: 993fedde-f343-44af-99c4-06f93e65b3cb
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:44.613000+00:00
-- started: 2026-08-03T09:10:44.730000+00:00
-- ended: 2026-08-03T09:10:44.893000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
