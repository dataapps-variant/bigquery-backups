-- job_id: a2fd1a5e-d7f0-4c2b-860c-2a24896c7cd7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:26.315000+00:00
-- started: 2026-08-03T11:51:26.418000+00:00
-- ended: 2026-08-03T11:51:26.669000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
