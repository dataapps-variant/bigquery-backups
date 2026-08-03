-- job_id: 14535a49-f073-4554-92b6-c25c5143f701
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:32.358000+00:00
-- started: 2026-08-03T12:36:32.456000+00:00
-- ended: 2026-08-03T12:36:32.747000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
