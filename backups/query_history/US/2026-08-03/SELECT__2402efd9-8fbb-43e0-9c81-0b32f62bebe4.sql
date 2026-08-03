-- job_id: 2402efd9-8fbb-43e0-9c81-0b32f62bebe4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:12.976000+00:00
-- started: 2026-08-03T09:13:13.069000+00:00
-- ended: 2026-08-03T09:13:13.232000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
