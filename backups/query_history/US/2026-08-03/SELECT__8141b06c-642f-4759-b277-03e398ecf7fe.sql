-- job_id: 8141b06c-642f-4759-b277-03e398ecf7fe
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:59.186000+00:00
-- started: 2026-08-03T09:32:59.284000+00:00
-- ended: 2026-08-03T09:32:59.465000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
