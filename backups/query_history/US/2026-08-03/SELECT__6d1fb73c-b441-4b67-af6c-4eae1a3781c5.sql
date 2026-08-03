-- job_id: 6d1fb73c-b441-4b67-af6c-4eae1a3781c5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:52.544000+00:00
-- started: 2026-08-03T11:51:52.634000+00:00
-- ended: 2026-08-03T11:51:52.895000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
