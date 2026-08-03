-- job_id: abf92d55-ca30-4cd1-8f60-31b4b842bf59
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:38.795000+00:00
-- started: 2026-08-03T12:28:38.880000+00:00
-- ended: 2026-08-03T12:28:39.449000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
