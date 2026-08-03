-- job_id: 3eeb0ffb-e292-47f4-9caf-aca10a906ea3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:47.356000+00:00
-- started: 2026-08-03T10:09:47.448000+00:00
-- ended: 2026-08-03T10:09:47.634000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
