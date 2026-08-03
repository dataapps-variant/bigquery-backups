-- job_id: 9850178e-89e2-4323-b795-5271231c65fc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:23.924000+00:00
-- started: 2026-08-03T12:30:24.010000+00:00
-- ended: 2026-08-03T12:30:24.195000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
