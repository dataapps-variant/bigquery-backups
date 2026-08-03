-- job_id: 923a756d-a069-4474-a2db-f64e5ff8c90f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:30.249000+00:00
-- started: 2026-08-03T10:10:30.315000+00:00
-- ended: 2026-08-03T10:10:30.478000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
