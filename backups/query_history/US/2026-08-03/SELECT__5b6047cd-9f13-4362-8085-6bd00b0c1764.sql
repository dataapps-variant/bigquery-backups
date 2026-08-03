-- job_id: 5b6047cd-9f13-4362-8085-6bd00b0c1764
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:18.051000+00:00
-- started: 2026-08-03T12:29:18.120000+00:00
-- ended: 2026-08-03T12:29:18.275000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
