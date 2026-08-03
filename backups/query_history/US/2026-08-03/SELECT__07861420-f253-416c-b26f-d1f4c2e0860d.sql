-- job_id: 07861420-f253-416c-b26f-d1f4c2e0860d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:50:59.653000+00:00
-- started: 2026-08-03T11:50:59.752000+00:00
-- ended: 2026-08-03T11:50:59.949000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
