-- job_id: 5cb03ca4-036a-4fed-bb27-e935d2411fb6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:46.129000+00:00
-- started: 2026-08-03T09:10:46.224000+00:00
-- ended: 2026-08-03T09:10:46.424000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
