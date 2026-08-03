-- job_id: 0269807f-6d07-4f50-9488-eb7224585719
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:13.264000+00:00
-- started: 2026-08-03T12:28:13.340000+00:00
-- ended: 2026-08-03T12:28:13.595000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
