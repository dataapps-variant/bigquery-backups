-- job_id: 57ea6880-dfe6-4d66-b45d-28dac12dd902
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:35.742000+00:00
-- started: 2026-08-03T09:05:35.819000+00:00
-- ended: 2026-08-03T09:05:36.008000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
