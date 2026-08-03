-- job_id: caa08e2f-76e1-46a4-9b57-b84e6a4ded79
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:42.202000+00:00
-- started: 2026-08-03T11:52:42.327000+00:00
-- ended: 2026-08-03T11:52:42.568000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
