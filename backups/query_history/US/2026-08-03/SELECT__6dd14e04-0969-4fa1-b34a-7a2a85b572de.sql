-- job_id: 6dd14e04-0969-4fa1-b34a-7a2a85b572de
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:07.987000+00:00
-- started: 2026-08-03T09:13:08.085000+00:00
-- ended: 2026-08-03T09:13:08.351000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
