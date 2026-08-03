-- job_id: 278ac049-d1a5-4642-8a25-ab5b1adc6cc3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:57.145000+00:00
-- started: 2026-08-03T09:10:57.224000+00:00
-- ended: 2026-08-03T09:10:57.455000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
