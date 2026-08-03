-- job_id: 85afd191-f858-452e-bc88-7c7ae07108a5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:31:38.418000+00:00
-- started: 2026-08-03T09:31:38.602000+00:00
-- ended: 2026-08-03T09:31:38.789000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
