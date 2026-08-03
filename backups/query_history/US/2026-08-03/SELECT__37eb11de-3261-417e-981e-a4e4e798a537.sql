-- job_id: 37eb11de-3261-417e-981e-a4e4e798a537
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:33.867000+00:00
-- started: 2026-08-03T09:13:33.937000+00:00
-- ended: 2026-08-03T09:13:34.102000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
