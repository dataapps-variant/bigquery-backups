-- job_id: 828f22e7-6be7-4e4e-8ee1-369510cb3398
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:21.499000+00:00
-- started: 2026-08-03T10:11:21.555000+00:00
-- ended: 2026-08-03T10:11:21.713000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
