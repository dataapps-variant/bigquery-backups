-- job_id: 666802db-28c2-42c8-b4cf-0496bd47d201
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:52.738000+00:00
-- started: 2026-08-03T12:28:52.860000+00:00
-- ended: 2026-08-03T12:28:53.018000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
