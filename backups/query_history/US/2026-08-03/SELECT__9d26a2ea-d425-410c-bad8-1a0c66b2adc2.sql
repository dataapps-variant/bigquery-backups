-- job_id: 9d26a2ea-d425-410c-bad8-1a0c66b2adc2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:43.477000+00:00
-- started: 2026-08-03T10:10:43.566000+00:00
-- ended: 2026-08-03T10:10:43.743000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
