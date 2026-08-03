-- job_id: cddfef8d-f40f-45da-903e-d30e0e783a14
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:04:52.834000+00:00
-- started: 2026-08-03T09:04:52.951000+00:00
-- ended: 2026-08-03T09:04:53.119000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
