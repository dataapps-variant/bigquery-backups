-- job_id: d7f63742-ef1f-40fa-b18c-cbd254d1b5d9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:24.566000+00:00
-- started: 2026-08-03T12:29:24.639000+00:00
-- ended: 2026-08-03T12:29:24.824000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
