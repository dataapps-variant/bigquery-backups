-- job_id: f9d0769e-db53-405e-9813-1ff10dfb8c69
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:59.610000+00:00
-- started: 2026-08-03T12:38:59.694000+00:00
-- ended: 2026-08-03T12:38:59.889000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
