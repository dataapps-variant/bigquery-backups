-- job_id: a76aae86-ac70-4253-b228-ab0882b0e49b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:42.495000+00:00
-- started: 2026-08-03T09:50:42.574000+00:00
-- ended: 2026-08-03T09:50:42.739000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
