-- job_id: 9b03aed6-222b-481a-af10-1e0909a3a77f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:18.176000+00:00
-- started: 2026-08-03T09:32:18.267000+00:00
-- ended: 2026-08-03T09:32:18.426000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
