-- job_id: 364c6760-cf2e-41e0-acc7-48303bf6874c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:11.674000+00:00
-- started: 2026-08-03T10:10:11.751000+00:00
-- ended: 2026-08-03T10:10:12.017000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
