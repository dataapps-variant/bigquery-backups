-- job_id: b7106139-853d-4ebd-8cad-6036ab694778
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:37.066000+00:00
-- started: 2026-08-03T11:52:37.281000+00:00
-- ended: 2026-08-03T11:52:37.546000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
