-- job_id: 71e94db9-1e00-47a6-9def-bbb04929f10e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:51.516000+00:00
-- started: 2026-08-03T10:08:51.612000+00:00
-- ended: 2026-08-03T10:08:51.794000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
