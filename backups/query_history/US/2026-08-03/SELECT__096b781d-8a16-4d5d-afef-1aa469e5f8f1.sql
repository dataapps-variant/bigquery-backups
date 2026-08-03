-- job_id: 096b781d-8a16-4d5d-afef-1aa469e5f8f1
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:06.248000+00:00
-- started: 2026-08-03T10:09:06.391000+00:00
-- ended: 2026-08-03T10:09:06.566000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
