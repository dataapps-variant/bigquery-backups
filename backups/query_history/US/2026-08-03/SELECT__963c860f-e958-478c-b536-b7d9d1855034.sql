-- job_id: 963c860f-e958-478c-b536-b7d9d1855034
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:07.974000+00:00
-- started: 2026-08-03T11:53:08.098000+00:00
-- ended: 2026-08-03T11:53:08.349000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
