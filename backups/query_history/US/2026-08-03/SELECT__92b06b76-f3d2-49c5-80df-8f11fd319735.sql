-- job_id: 92b06b76-f3d2-49c5-80df-8f11fd319735
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:35.966000+00:00
-- started: 2026-08-03T12:36:36.064000+00:00
-- ended: 2026-08-03T12:36:36.268000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
