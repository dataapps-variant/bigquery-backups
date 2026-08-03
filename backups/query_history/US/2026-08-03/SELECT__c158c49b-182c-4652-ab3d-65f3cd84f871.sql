-- job_id: c158c49b-182c-4652-ab3d-65f3cd84f871
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:04:56.087000+00:00
-- started: 2026-08-03T09:04:56.189000+00:00
-- ended: 2026-08-03T09:04:56.893000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
