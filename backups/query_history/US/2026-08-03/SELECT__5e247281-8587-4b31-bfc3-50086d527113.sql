-- job_id: 5e247281-8587-4b31-bfc3-50086d527113
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:35.401000+00:00
-- started: 2026-08-03T10:09:35.715000+00:00
-- ended: 2026-08-03T10:09:35.946000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
