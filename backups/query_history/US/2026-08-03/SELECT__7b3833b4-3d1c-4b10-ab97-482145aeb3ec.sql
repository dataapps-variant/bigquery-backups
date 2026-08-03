-- job_id: 7b3833b4-3d1c-4b10-ab97-482145aeb3ec
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:58.598000+00:00
-- started: 2026-08-03T12:36:58.689000+00:00
-- ended: 2026-08-03T12:36:58.858000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
