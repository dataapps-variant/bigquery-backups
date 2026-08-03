-- job_id: 92fda098-954e-4734-a1bc-2e578bdfa454
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:46:03.690000+00:00
-- started: 2026-08-03T09:46:03.844000+00:00
-- ended: 2026-08-03T09:46:04.136000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
