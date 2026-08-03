-- job_id: acd3d611-9fe4-4078-b1de-c5d89d8063f5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:45.899000+00:00
-- started: 2026-08-03T12:36:45.989000+00:00
-- ended: 2026-08-03T12:36:46.152000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
