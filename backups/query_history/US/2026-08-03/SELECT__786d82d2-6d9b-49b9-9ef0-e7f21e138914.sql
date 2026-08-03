-- job_id: 786d82d2-6d9b-49b9-9ef0-e7f21e138914
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:03.596000+00:00
-- started: 2026-08-03T13:02:03.729000+00:00
-- ended: 2026-08-03T13:02:04.024000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
