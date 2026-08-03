-- job_id: b25a757d-4306-405a-a8e5-010dc3042ecb
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:48.031000+00:00
-- started: 2026-08-03T09:32:48.127000+00:00
-- ended: 2026-08-03T09:32:48.306000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
