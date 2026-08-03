-- job_id: 8db60ff2-843c-45c3-a6bc-bf1d6a6a4739
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:41.512000+00:00
-- started: 2026-08-03T13:01:41.640000+00:00
-- ended: 2026-08-03T13:01:41.876000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
