-- job_id: 7807ba43-7638-4705-846c-ed32a2a90385
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:09:54.944000+00:00
-- started: 2026-08-03T09:09:55.022000+00:00
-- ended: 2026-08-03T09:09:55.223000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
