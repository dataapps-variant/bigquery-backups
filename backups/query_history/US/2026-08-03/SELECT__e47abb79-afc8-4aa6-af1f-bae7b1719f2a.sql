-- job_id: e47abb79-afc8-4aa6-af1f-bae7b1719f2a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:54.727000+00:00
-- started: 2026-08-03T09:50:54.819000+00:00
-- ended: 2026-08-03T09:50:54.989000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
