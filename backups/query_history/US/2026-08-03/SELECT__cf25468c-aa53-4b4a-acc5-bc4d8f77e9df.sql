-- job_id: cf25468c-aa53-4b4a-acc5-bc4d8f77e9df
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:19.439000+00:00
-- started: 2026-08-03T12:28:19.517000+00:00
-- ended: 2026-08-03T12:28:19.699000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
