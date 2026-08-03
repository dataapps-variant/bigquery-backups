-- job_id: 9b9ce1ac-f9d0-43c1-a80e-21d8924ff307
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:58.727000+00:00
-- started: 2026-08-03T09:10:58.833000+00:00
-- ended: 2026-08-03T09:10:59.004000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
