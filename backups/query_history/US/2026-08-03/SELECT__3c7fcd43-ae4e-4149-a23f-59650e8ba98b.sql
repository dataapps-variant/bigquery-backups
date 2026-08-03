-- job_id: 3c7fcd43-ae4e-4149-a23f-59650e8ba98b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:20.854000+00:00
-- started: 2026-08-03T09:13:21.010000+00:00
-- ended: 2026-08-03T09:13:21.195000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
