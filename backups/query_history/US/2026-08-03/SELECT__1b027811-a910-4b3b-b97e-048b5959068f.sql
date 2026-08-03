-- job_id: 1b027811-a910-4b3b-b97e-048b5959068f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:13.047000+00:00
-- started: 2026-08-03T11:51:13.150000+00:00
-- ended: 2026-08-03T11:51:13.321000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
