-- job_id: bdb90e18-ffe1-4101-9b7c-30565cdcc447
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:53.576000+00:00
-- started: 2026-08-03T10:10:53.630000+00:00
-- ended: 2026-08-03T10:10:53.815000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
