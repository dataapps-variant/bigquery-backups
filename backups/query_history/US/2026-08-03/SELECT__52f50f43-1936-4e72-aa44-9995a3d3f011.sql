-- job_id: 52f50f43-1936-4e72-aa44-9995a3d3f011
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:01.972000+00:00
-- started: 2026-08-03T09:50:02.065000+00:00
-- ended: 2026-08-03T09:50:02.257000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
