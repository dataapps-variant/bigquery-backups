-- job_id: a1bf9897-d5a4-4604-bd6f-e772c9df7653
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:55.474000+00:00
-- started: 2026-08-03T09:10:55.599000+00:00
-- ended: 2026-08-03T09:10:55.853000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
