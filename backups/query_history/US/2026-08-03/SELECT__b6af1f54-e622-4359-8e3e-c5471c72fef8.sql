-- job_id: b6af1f54-e622-4359-8e3e-c5471c72fef8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:18.286000+00:00
-- started: 2026-08-03T10:11:18.357000+00:00
-- ended: 2026-08-03T10:11:18.547000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
