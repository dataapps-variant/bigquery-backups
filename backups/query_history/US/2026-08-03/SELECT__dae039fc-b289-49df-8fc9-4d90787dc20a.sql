-- job_id: dae039fc-b289-49df-8fc9-4d90787dc20a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:26.377000+00:00
-- started: 2026-08-03T09:12:26.693000+00:00
-- ended: 2026-08-03T09:12:26.901000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
