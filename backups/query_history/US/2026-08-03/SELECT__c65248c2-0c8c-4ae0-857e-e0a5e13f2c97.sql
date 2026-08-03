-- job_id: c65248c2-0c8c-4ae0-857e-e0a5e13f2c97
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:22.053000+00:00
-- started: 2026-08-03T11:53:22.139000+00:00
-- ended: 2026-08-03T11:53:22.385000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
