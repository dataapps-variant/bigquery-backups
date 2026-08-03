-- job_id: 674fa7d9-c4f0-4330-94b1-6b008191aa79
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:46.806000+00:00
-- started: 2026-08-03T13:03:46.885000+00:00
-- ended: 2026-08-03T13:03:47.097000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
