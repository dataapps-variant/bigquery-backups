-- job_id: 818e48c6-d7c9-4e46-8980-3df2ff101377
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:54.262000+00:00
-- started: 2026-08-03T10:09:54.356000+00:00
-- ended: 2026-08-03T10:09:54.522000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
