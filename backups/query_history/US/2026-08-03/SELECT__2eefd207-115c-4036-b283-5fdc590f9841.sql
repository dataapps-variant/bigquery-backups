-- job_id: 2eefd207-115c-4036-b283-5fdc590f9841
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:50.728000+00:00
-- started: 2026-08-03T10:09:50.821000+00:00
-- ended: 2026-08-03T10:09:51.040000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
