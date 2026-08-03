-- job_id: 7672071e-5883-4f2a-8a76-a45b9eda0a91
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:29.895000+00:00
-- started: 2026-08-03T09:50:29.956000+00:00
-- ended: 2026-08-03T09:50:30.152000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
