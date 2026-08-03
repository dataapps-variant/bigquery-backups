-- job_id: 41c8debc-0390-4857-bba4-b38ce5a84888
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:05.426000+00:00
-- started: 2026-08-03T12:38:05.534000+00:00
-- ended: 2026-08-03T12:38:05.954000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
