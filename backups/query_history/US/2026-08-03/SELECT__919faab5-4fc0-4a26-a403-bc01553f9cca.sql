-- job_id: 919faab5-4fc0-4a26-a403-bc01553f9cca
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:09.028000+00:00
-- started: 2026-08-03T09:45:09.141000+00:00
-- ended: 2026-08-03T09:45:09.361000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
