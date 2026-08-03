-- job_id: 746feda9-157b-4099-bba6-fcc753dcba9c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:29.891000+00:00
-- started: 2026-08-03T12:30:29.965000+00:00
-- ended: 2026-08-03T12:30:30.171000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
