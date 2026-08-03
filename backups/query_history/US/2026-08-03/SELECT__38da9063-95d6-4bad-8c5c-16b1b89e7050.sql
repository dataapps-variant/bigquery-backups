-- job_id: 38da9063-95d6-4bad-8c5c-16b1b89e7050
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:26.330000+00:00
-- started: 2026-08-03T11:53:26.428000+00:00
-- ended: 2026-08-03T11:53:26.640000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
