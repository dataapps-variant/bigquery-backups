-- job_id: 2e3f5779-03d5-4112-baa6-40f09dc88bea
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:36.615000+00:00
-- started: 2026-08-03T10:10:36.696000+00:00
-- ended: 2026-08-03T10:10:36.846000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
