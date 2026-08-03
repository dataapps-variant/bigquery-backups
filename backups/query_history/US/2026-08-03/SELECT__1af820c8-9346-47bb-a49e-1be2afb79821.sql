-- job_id: 1af820c8-9346-47bb-a49e-1be2afb79821
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:03.870000+00:00
-- started: 2026-08-03T13:03:03.976000+00:00
-- ended: 2026-08-03T13:03:04.165000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
