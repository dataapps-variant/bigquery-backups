-- job_id: 6c904026-b741-492a-91e0-1ca889bdf887
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:43.868000+00:00
-- started: 2026-08-03T12:29:43.932000+00:00
-- ended: 2026-08-03T12:29:44.087000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
