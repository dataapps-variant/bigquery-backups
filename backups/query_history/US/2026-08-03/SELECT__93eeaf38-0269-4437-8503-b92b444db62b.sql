-- job_id: 93eeaf38-0269-4437-8503-b92b444db62b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:06.049000+00:00
-- started: 2026-08-03T12:28:06.107000+00:00
-- ended: 2026-08-03T12:28:06.321000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
