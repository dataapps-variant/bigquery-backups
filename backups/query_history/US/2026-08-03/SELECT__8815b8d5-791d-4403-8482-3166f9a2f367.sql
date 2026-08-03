-- job_id: 8815b8d5-791d-4403-8482-3166f9a2f367
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:47.447000+00:00
-- started: 2026-08-03T10:09:47.551000+00:00
-- ended: 2026-08-03T10:09:47.711000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
