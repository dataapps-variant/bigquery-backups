-- job_id: 55754fb7-43e0-431b-b9ff-34c0dd57fd8c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:33.024000+00:00
-- started: 2026-08-03T09:10:33.148000+00:00
-- ended: 2026-08-03T09:10:33.334000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
