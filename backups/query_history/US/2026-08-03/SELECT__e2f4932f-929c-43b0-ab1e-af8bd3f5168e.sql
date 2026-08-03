-- job_id: e2f4932f-929c-43b0-ab1e-af8bd3f5168e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:01.893000+00:00
-- started: 2026-08-03T09:13:01.988000+00:00
-- ended: 2026-08-03T09:13:02.164000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
