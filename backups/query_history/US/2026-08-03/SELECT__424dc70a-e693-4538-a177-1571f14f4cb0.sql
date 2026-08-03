-- job_id: 424dc70a-e693-4538-a177-1571f14f4cb0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:03.145000+00:00
-- started: 2026-08-03T11:51:03.229000+00:00
-- ended: 2026-08-03T11:51:03.414000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
