-- job_id: be0c0f72-1963-4c84-86ab-1df88ef0eccf
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:52.578000+00:00
-- started: 2026-08-03T09:45:52.695000+00:00
-- ended: 2026-08-03T09:45:52.952000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.fivetran_oftener_pseudo_staging`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
