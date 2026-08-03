-- job_id: b00c7716-329f-4ee8-ad31-9792dc87188d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:24.672000+00:00
-- started: 2026-08-03T10:11:24.746000+00:00
-- ended: 2026-08-03T10:11:24.935000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
