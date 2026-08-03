-- job_id: 99c3a0bd-848a-48c1-bd37-c8389a432f27
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:33.400000+00:00
-- started: 2026-08-03T13:02:33.455000+00:00
-- ended: 2026-08-03T13:02:33.706000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
