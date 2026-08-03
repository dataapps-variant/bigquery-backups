-- job_id: cfe00da2-f189-4b6f-8953-453db042d640
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:11.520000+00:00
-- started: 2026-08-03T12:30:11.605000+00:00
-- ended: 2026-08-03T12:30:11.808000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
