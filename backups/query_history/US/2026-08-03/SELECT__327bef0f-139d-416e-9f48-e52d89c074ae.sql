-- job_id: 327bef0f-139d-416e-9f48-e52d89c074ae
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:49.543000+00:00
-- started: 2026-08-03T09:32:49.623000+00:00
-- ended: 2026-08-03T09:32:49.830000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
