-- job_id: 15e9cbcd-b2bc-4263-a911-7a5739fe68f2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:41.939000+00:00
-- started: 2026-08-03T10:08:42.034000+00:00
-- ended: 2026-08-03T10:08:42.232000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
