-- job_id: bc0612fc-c5ee-477b-9edb-0e422d5a51cd
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:23.270000+00:00
-- started: 2026-08-03T09:10:23.386000+00:00
-- ended: 2026-08-03T09:10:23.584000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
