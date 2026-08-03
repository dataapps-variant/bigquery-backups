-- job_id: d623cbf8-2d4e-494b-8220-154c7c49853e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:44:58.242000+00:00
-- started: 2026-08-03T09:44:58.382000+00:00
-- ended: 2026-08-03T09:44:58.600000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
