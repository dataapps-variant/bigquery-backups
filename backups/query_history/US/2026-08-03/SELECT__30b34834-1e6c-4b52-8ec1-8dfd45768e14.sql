-- job_id: 30b34834-1e6c-4b52-8ec1-8dfd45768e14
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:11.058000+00:00
-- started: 2026-08-03T10:11:11.132000+00:00
-- ended: 2026-08-03T10:11:11.309000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
