-- job_id: 2b5ec4ff-fea5-4632-a129-0e59bdc8e63f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:46.229000+00:00
-- started: 2026-08-03T13:02:46.337000+00:00
-- ended: 2026-08-03T13:02:46.530000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
