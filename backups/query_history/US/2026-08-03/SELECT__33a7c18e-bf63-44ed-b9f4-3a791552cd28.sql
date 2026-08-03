-- job_id: 33a7c18e-bf63-44ed-b9f4-3a791552cd28
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:39.236000+00:00
-- started: 2026-08-03T12:36:39.302000+00:00
-- ended: 2026-08-03T12:36:39.488000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
