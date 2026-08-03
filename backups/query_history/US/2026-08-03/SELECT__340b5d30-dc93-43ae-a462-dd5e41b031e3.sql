-- job_id: 340b5d30-dc93-43ae-a462-dd5e41b031e3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:20.843000+00:00
-- started: 2026-08-03T13:03:20.927000+00:00
-- ended: 2026-08-03T13:03:21.116000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
