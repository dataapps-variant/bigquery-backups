-- job_id: 3974ad72-fbb0-4e0a-9803-085bc147820d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:13.033000+00:00
-- started: 2026-08-03T10:09:13.112000+00:00
-- ended: 2026-08-03T10:09:13.298000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
