-- job_id: 0c4894f2-fc98-45f4-b072-27f57fc62572
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:22.452000+00:00
-- started: 2026-08-03T09:13:22.529000+00:00
-- ended: 2026-08-03T09:13:22.695000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
