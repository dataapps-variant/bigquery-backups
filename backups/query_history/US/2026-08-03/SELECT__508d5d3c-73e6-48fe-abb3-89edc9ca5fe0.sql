-- job_id: 508d5d3c-73e6-48fe-abb3-89edc9ca5fe0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:14.663000+00:00
-- started: 2026-08-03T09:10:14.753000+00:00
-- ended: 2026-08-03T09:10:14.936000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
