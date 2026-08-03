-- job_id: 1d169e89-cba8-47ab-b0d7-7178f0177763
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:10.308000+00:00
-- started: 2026-08-03T10:09:10.411000+00:00
-- ended: 2026-08-03T10:09:10.676000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
