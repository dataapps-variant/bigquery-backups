-- job_id: bfffc5c5-7c9e-4beb-b81d-7625f01fa692
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:00.204000+00:00
-- started: 2026-08-03T11:53:00.319000+00:00
-- ended: 2026-08-03T11:53:00.506000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_metadata`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
