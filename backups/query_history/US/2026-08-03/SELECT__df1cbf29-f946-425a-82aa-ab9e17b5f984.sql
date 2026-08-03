-- job_id: df1cbf29-f946-425a-82aa-ab9e17b5f984
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:37.152000+00:00
-- started: 2026-08-03T12:37:37.259000+00:00
-- ended: 2026-08-03T12:37:37.450000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
