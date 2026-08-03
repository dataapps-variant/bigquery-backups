-- job_id: 1923302f-2003-4a3a-94bf-0856cfebb647
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:47.300000+00:00
-- started: 2026-08-03T11:52:47.376000+00:00
-- ended: 2026-08-03T11:52:47.542000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
