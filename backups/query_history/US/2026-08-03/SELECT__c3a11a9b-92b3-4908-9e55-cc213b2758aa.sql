-- job_id: c3a11a9b-92b3-4908-9e55-cc213b2758aa
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:47.530000+00:00
-- started: 2026-08-03T12:38:47.618000+00:00
-- ended: 2026-08-03T12:38:47.770000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
