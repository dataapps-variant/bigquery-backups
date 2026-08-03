-- job_id: e22376db-5124-4043-bd5f-efe4dce8dd6b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:21.152000+00:00
-- started: 2026-08-03T09:45:21.301000+00:00
-- ended: 2026-08-03T09:45:21.563000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
