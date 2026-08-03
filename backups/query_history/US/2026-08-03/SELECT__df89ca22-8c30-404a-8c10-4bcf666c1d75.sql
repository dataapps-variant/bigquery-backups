-- job_id: df89ca22-8c30-404a-8c10-4bcf666c1d75
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:36.262000+00:00
-- started: 2026-08-03T09:32:36.442000+00:00
-- ended: 2026-08-03T09:32:36.662000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
