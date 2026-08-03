-- job_id: 7182f5bc-9e4d-46d5-a1b0-ea70d7893254
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:42.271000+00:00
-- started: 2026-08-03T10:10:42.348000+00:00
-- ended: 2026-08-03T10:10:42.529000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
