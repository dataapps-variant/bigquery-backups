-- job_id: 918404f4-c180-4f81-923e-10299cefec14
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:00.668000+00:00
-- started: 2026-08-03T09:32:00.780000+00:00
-- ended: 2026-08-03T09:32:01.042000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
