-- job_id: 0238d1b3-45b6-4176-95d6-4daac06bdbc4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:26.292000+00:00
-- started: 2026-08-03T12:37:26.413000+00:00
-- ended: 2026-08-03T12:37:26.643000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
