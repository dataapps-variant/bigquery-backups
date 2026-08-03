-- job_id: e41b8860-87c6-4fe4-a06d-331f06f91e5c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:32.193000+00:00
-- started: 2026-08-03T09:13:32.266000+00:00
-- ended: 2026-08-03T09:13:32.432000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
