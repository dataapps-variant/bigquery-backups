-- job_id: d0b0ee03-c698-4efe-9c70-41cbdf14cba1
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:43.365000+00:00
-- started: 2026-08-03T12:37:43.430000+00:00
-- ended: 2026-08-03T12:37:43.598000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
