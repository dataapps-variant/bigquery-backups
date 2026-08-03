-- job_id: a42899b7-4cca-4272-ba11-583af5b7b788
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:38.196000+00:00
-- started: 2026-08-03T09:10:38.302000+00:00
-- ended: 2026-08-03T09:10:38.464000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
