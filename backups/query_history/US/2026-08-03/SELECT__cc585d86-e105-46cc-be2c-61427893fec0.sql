-- job_id: cc585d86-e105-46cc-be2c-61427893fec0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:55.439000+00:00
-- started: 2026-08-03T09:49:55.506000+00:00
-- ended: 2026-08-03T09:49:55.688000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
