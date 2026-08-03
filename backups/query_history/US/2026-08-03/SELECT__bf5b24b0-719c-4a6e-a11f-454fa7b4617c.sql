-- job_id: bf5b24b0-719c-4a6e-a11f-454fa7b4617c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:49.134000+00:00
-- started: 2026-08-03T12:36:49.224000+00:00
-- ended: 2026-08-03T12:36:49.423000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
