-- job_id: 96ec87b1-e5fa-4826-975e-e0eaf7d53c82
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:11:00.350000+00:00
-- started: 2026-08-03T09:11:00.504000+00:00
-- ended: 2026-08-03T09:11:00.700000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
