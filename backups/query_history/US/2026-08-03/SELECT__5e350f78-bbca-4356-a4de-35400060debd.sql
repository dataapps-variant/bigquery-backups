-- job_id: 5e350f78-bbca-4356-a4de-35400060debd
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:29.842000+00:00
-- started: 2026-08-03T12:38:29.916000+00:00
-- ended: 2026-08-03T12:38:30.109000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
