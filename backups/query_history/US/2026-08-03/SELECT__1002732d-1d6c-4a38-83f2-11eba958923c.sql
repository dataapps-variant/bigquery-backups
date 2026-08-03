-- job_id: 1002732d-1d6c-4a38-83f2-11eba958923c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:06.422000+00:00
-- started: 2026-08-03T11:51:06.514000+00:00
-- ended: 2026-08-03T11:51:06.727000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
