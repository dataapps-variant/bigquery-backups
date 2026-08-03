-- job_id: 543c230c-7c83-4c13-9728-86643ba0c5e6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:43.899000+00:00
-- started: 2026-08-03T09:45:44.078000+00:00
-- ended: 2026-08-03T09:45:44.320000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
