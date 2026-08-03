-- job_id: 9e6f3c38-5f37-43af-9cb0-d655c1dce439
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:09:44.999000+00:00
-- started: 2026-08-03T09:09:45.094000+00:00
-- ended: 2026-08-03T09:09:45.276000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
