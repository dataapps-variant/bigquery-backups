-- job_id: e5ab8aab-3919-4faa-bd6e-e8361c9a30e7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:51:13.875000+00:00
-- started: 2026-08-03T09:51:13.947000+00:00
-- ended: 2026-08-03T09:51:14.186000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
