-- job_id: 0278433f-0b0f-4746-9296-d61eaf0b9eb5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:48.197000+00:00
-- started: 2026-08-03T10:10:48.286000+00:00
-- ended: 2026-08-03T10:10:48.463000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
