-- job_id: 30097f73-8878-44cd-8887-0c460615974b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:20.427000+00:00
-- started: 2026-08-03T10:09:20.541000+00:00
-- ended: 2026-08-03T10:09:20.706000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
