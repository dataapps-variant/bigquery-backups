-- job_id: a4d364ab-a057-4555-8add-3dd7bd34947f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:43.941000+00:00
-- started: 2026-08-03T09:50:44.078000+00:00
-- ended: 2026-08-03T09:50:44.323000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
