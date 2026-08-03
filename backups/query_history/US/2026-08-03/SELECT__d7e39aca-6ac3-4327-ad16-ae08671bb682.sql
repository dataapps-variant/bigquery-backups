-- job_id: d7e39aca-6ac3-4327-ad16-ae08671bb682
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:49.916000+00:00
-- started: 2026-08-03T12:29:49.971000+00:00
-- ended: 2026-08-03T12:29:50.152000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
