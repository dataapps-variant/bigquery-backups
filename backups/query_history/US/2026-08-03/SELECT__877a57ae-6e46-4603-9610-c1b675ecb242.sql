-- job_id: 877a57ae-6e46-4603-9610-c1b675ecb242
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:45.311000+00:00
-- started: 2026-08-03T10:10:45.386000+00:00
-- ended: 2026-08-03T10:10:45.559000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
