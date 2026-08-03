-- job_id: 0ba9751d-c80e-4b27-953f-ddc36efb1681
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:19.604000+00:00
-- started: 2026-08-03T09:10:19.724000+00:00
-- ended: 2026-08-03T09:10:19.925000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
