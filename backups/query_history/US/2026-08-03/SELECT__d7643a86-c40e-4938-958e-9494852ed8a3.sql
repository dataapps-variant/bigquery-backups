-- job_id: d7643a86-c40e-4938-958e-9494852ed8a3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:49.368000+00:00
-- started: 2026-08-03T11:51:49.455000+00:00
-- ended: 2026-08-03T11:51:49.637000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
