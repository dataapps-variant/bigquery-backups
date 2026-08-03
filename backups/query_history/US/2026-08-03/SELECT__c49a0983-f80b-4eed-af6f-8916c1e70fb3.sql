-- job_id: c49a0983-f80b-4eed-af6f-8916c1e70fb3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:48:38.993000+00:00
-- started: 2026-08-03T09:48:39.102000+00:00
-- ended: 2026-08-03T09:48:39.268000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
