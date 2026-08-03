-- job_id: 6018c413-5ac0-4436-b7c5-5b7f52080a11
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:24.467000+00:00
-- started: 2026-08-03T10:11:24.548000+00:00
-- ended: 2026-08-03T10:11:24.739000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
