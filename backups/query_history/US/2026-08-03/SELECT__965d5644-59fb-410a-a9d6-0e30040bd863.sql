-- job_id: 965d5644-59fb-410a-a9d6-0e30040bd863
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:31:40.126000+00:00
-- started: 2026-08-03T09:31:40.250000+00:00
-- ended: 2026-08-03T09:31:40.426000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
