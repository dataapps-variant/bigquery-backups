-- job_id: 9873eefc-cabf-4322-a34a-d8efb2491df1
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:14.823000+00:00
-- started: 2026-08-03T09:32:14.923000+00:00
-- ended: 2026-08-03T09:32:15.120000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
