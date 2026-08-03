-- job_id: efef840e-a9af-4522-bb55-af204a5be959
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:23.064000+00:00
-- started: 2026-08-03T12:37:23.172000+00:00
-- ended: 2026-08-03T12:37:23.483000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
