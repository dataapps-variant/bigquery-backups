-- job_id: 3eb9943a-c608-4cc7-a173-048507fbdc04
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:50.944000+00:00
-- started: 2026-08-03T09:05:51.033000+00:00
-- ended: 2026-08-03T09:05:51.204000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
