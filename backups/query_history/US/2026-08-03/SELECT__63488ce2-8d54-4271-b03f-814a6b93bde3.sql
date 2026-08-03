-- job_id: 63488ce2-8d54-4271-b03f-814a6b93bde3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:06.586000+00:00
-- started: 2026-08-03T09:10:06.706000+00:00
-- ended: 2026-08-03T09:10:06.981000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
