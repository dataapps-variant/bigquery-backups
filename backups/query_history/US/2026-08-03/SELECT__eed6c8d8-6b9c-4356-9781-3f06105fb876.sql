-- job_id: eed6c8d8-6b9c-4356-9781-3f06105fb876
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:55.486000+00:00
-- started: 2026-08-03T10:08:55.547000+00:00
-- ended: 2026-08-03T10:08:55.742000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
