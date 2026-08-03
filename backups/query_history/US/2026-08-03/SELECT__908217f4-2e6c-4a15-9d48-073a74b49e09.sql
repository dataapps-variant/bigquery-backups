-- job_id: 908217f4-2e6c-4a15-9d48-073a74b49e09
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:39.238000+00:00
-- started: 2026-08-03T10:10:39.318000+00:00
-- ended: 2026-08-03T10:10:39.479000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
