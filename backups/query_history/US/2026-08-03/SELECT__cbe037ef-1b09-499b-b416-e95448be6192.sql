-- job_id: cbe037ef-1b09-499b-b416-e95448be6192
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:21.206000+00:00
-- started: 2026-08-03T10:11:21.292000+00:00
-- ended: 2026-08-03T10:11:21.460000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
