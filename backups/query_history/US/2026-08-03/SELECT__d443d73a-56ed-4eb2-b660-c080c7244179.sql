-- job_id: d443d73a-56ed-4eb2-b660-c080c7244179
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:06:06.401000+00:00
-- started: 2026-08-03T09:06:06.570000+00:00
-- ended: 2026-08-03T09:06:06.732000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
