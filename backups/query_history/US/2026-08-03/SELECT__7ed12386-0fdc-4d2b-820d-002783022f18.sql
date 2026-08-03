-- job_id: 7ed12386-0fdc-4d2b-820d-002783022f18
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:31:45.557000+00:00
-- started: 2026-08-03T09:31:45.675000+00:00
-- ended: 2026-08-03T09:31:45.895000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
