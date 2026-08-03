-- job_id: fd76a8a5-5e68-421a-9b3f-8b2eea4d4db3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:13.717000+00:00
-- started: 2026-08-03T10:10:13.803000+00:00
-- ended: 2026-08-03T10:10:14.033000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
