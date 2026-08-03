-- job_id: c1ce1066-6f95-48aa-9a47-d573e3578cfd
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:03.318000+00:00
-- started: 2026-08-03T11:53:03.410000+00:00
-- ended: 2026-08-03T11:53:03.613000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
