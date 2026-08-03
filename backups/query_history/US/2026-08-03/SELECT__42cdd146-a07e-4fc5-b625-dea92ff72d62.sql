-- job_id: 42cdd146-a07e-4fc5-b625-dea92ff72d62
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:44.816000+00:00
-- started: 2026-08-03T10:11:44.867000+00:00
-- ended: 2026-08-03T10:11:45.015000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
