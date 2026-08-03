-- job_id: 358db325-ff0f-4e90-bf94-dc36fcd94e97
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:32.661000+00:00
-- started: 2026-08-03T11:53:32.793000+00:00
-- ended: 2026-08-03T11:53:32.993000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
