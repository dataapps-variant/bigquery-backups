-- job_id: 51f2aea4-06fa-4a94-9ee3-470917e5f5c6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:35.259000+00:00
-- started: 2026-08-03T09:12:35.339000+00:00
-- ended: 2026-08-03T09:12:35.913000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
