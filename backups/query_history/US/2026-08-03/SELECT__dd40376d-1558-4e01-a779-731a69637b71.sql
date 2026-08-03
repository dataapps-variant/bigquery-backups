-- job_id: dd40376d-1558-4e01-a779-731a69637b71
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:32.912000+00:00
-- started: 2026-08-03T10:10:32.969000+00:00
-- ended: 2026-08-03T10:10:33.380000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
