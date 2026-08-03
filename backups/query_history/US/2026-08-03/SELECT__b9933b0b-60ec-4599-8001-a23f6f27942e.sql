-- job_id: b9933b0b-60ec-4599-8001-a23f6f27942e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:37.495000+00:00
-- started: 2026-08-03T10:08:37.642000+00:00
-- ended: 2026-08-03T10:08:37.854000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
