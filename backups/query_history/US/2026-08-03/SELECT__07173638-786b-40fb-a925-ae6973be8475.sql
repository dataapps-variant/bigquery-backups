-- job_id: 07173638-786b-40fb-a925-ae6973be8475
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:04:48.079000+00:00
-- started: 2026-08-03T09:04:48.175000+00:00
-- ended: 2026-08-03T09:04:48.380000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
