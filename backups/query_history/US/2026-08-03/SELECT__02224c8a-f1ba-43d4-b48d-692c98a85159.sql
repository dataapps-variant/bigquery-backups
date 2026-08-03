-- job_id: 02224c8a-f1ba-43d4-b48d-692c98a85159
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:33.329000+00:00
-- started: 2026-08-03T10:10:33.399000+00:00
-- ended: 2026-08-03T10:10:33.567000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
