-- job_id: 98329895-abef-4a96-90dd-3eaccc1ac60d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:27.959000+00:00
-- started: 2026-08-03T10:11:28.074000+00:00
-- ended: 2026-08-03T10:11:28.263000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
