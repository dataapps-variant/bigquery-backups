-- job_id: 4f875601-84c8-49b1-85c6-aa37318b6e21
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:18.091000+00:00
-- started: 2026-08-03T10:11:18.177000+00:00
-- ended: 2026-08-03T10:11:18.342000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
