-- job_id: c02bd9d6-24fd-45d7-9a1c-823a6b3fa906
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:44.333000+00:00
-- started: 2026-08-03T09:05:44.430000+00:00
-- ended: 2026-08-03T09:05:44.583000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
