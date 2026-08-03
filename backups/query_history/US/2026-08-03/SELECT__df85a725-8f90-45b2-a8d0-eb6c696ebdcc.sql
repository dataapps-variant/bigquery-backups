-- job_id: df85a725-8f90-45b2-a8d0-eb6c696ebdcc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:46:07.231000+00:00
-- started: 2026-08-03T09:46:07.369000+00:00
-- ended: 2026-08-03T09:46:07.634000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
