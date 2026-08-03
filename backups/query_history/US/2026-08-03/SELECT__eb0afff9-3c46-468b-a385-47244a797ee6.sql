-- job_id: eb0afff9-3c46-468b-a385-47244a797ee6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:40.529000+00:00
-- started: 2026-08-03T11:52:40.620000+00:00
-- ended: 2026-08-03T11:52:40.841000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
