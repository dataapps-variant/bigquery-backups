-- job_id: 2ce3dc31-dc44-4a07-9e9c-382f34255259
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:24.650000+00:00
-- started: 2026-08-03T09:32:24.931000+00:00
-- ended: 2026-08-03T09:32:25.152000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
