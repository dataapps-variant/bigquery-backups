-- job_id: 58f591ba-2808-4933-b4e5-295949a16dd9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:23.411000+00:00
-- started: 2026-08-03T09:12:23.503000+00:00
-- ended: 2026-08-03T09:12:23.660000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
