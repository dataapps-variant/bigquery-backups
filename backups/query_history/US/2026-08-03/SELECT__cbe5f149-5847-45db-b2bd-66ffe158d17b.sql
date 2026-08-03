-- job_id: cbe5f149-5847-45db-b2bd-66ffe158d17b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:22.596000+00:00
-- started: 2026-08-03T12:28:22.822000+00:00
-- ended: 2026-08-03T12:28:23.045000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
