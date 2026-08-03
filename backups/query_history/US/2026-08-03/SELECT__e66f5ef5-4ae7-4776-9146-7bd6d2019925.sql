-- job_id: e66f5ef5-4ae7-4776-9146-7bd6d2019925
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:28.701000+00:00
-- started: 2026-08-03T12:28:28.750000+00:00
-- ended: 2026-08-03T12:28:28.950000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
