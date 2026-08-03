-- job_id: fddf3455-a480-446b-8629-88dba1a85095
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:08.243000+00:00
-- started: 2026-08-03T09:05:08.337000+00:00
-- ended: 2026-08-03T09:05:08.566000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
