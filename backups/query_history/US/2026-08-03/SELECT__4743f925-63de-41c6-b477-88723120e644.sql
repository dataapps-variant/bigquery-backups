-- job_id: 4743f925-63de-41c6-b477-88723120e644
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:37.029000+00:00
-- started: 2026-08-03T09:13:37.094000+00:00
-- ended: 2026-08-03T09:13:37.232000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
