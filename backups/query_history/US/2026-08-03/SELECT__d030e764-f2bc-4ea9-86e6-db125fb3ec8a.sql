-- job_id: d030e764-f2bc-4ea9-86e6-db125fb3ec8a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:29.643000+00:00
-- started: 2026-08-03T09:32:29.732000+00:00
-- ended: 2026-08-03T09:32:29.928000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
