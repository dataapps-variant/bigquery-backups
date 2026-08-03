-- job_id: 4bc5a717-2d4b-40df-9052-437ea7ab0d76
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:21.491000+00:00
-- started: 2026-08-03T12:29:21.551000+00:00
-- ended: 2026-08-03T12:29:21.882000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
