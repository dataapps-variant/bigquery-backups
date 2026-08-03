-- job_id: 311606e3-0537-44a8-a258-cb28fd8988fc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:10.678000+00:00
-- started: 2026-08-03T13:03:10.745000+00:00
-- ended: 2026-08-03T13:03:10.975000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
