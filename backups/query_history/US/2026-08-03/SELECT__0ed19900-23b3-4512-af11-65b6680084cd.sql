-- job_id: 0ed19900-23b3-4512-af11-65b6680084cd
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:18.468000+00:00
-- started: 2026-08-03T10:09:18.862000+00:00
-- ended: 2026-08-03T10:09:19.434000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
