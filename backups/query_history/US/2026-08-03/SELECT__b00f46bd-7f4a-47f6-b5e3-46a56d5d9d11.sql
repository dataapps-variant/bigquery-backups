-- job_id: b00f46bd-7f4a-47f6-b5e3-46a56d5d9d11
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:51:07.846000+00:00
-- started: 2026-08-03T09:51:07.918000+00:00
-- ended: 2026-08-03T09:51:08.086000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
