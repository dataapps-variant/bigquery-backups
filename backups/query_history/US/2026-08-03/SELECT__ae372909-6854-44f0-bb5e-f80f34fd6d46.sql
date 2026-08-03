-- job_id: ae372909-6854-44f0-bb5e-f80f34fd6d46
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:03.329000+00:00
-- started: 2026-08-03T09:10:03.433000+00:00
-- ended: 2026-08-03T09:10:03.994000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
