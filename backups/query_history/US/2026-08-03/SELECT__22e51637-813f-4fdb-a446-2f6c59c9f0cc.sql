-- job_id: 22e51637-813f-4fdb-a446-2f6c59c9f0cc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:44:59.944000+00:00
-- started: 2026-08-03T09:45:00.081000+00:00
-- ended: 2026-08-03T09:45:00.318000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
