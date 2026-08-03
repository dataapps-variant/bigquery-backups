-- job_id: 18b300c0-e624-4e37-bfb3-a9feca75ec2d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:32.956000+00:00
-- started: 2026-08-03T09:49:33.086000+00:00
-- ended: 2026-08-03T09:49:33.261000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
