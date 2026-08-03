-- job_id: 635f4f63-831f-4320-bece-70443e0823f7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:26.850000+00:00
-- started: 2026-08-03T09:50:26.921000+00:00
-- ended: 2026-08-03T09:50:27.098000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
