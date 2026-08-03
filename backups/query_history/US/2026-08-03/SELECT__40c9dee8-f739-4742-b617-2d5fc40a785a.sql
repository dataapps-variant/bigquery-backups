-- job_id: 40c9dee8-f739-4742-b617-2d5fc40a785a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:03.516000+00:00
-- started: 2026-08-03T09:45:03.638000+00:00
-- ended: 2026-08-03T09:45:03.857000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Facebook_ad_click_data`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
