-- job_id: 12b5dcd5-ac32-452b-945d-0f3fd9e80060
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:14.914000+00:00
-- started: 2026-08-03T12:38:15.027000+00:00
-- ended: 2026-08-03T12:38:15.211000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
