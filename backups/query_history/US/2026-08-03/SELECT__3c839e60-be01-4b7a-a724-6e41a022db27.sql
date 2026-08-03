-- job_id: 3c839e60-be01-4b7a-a724-6e41a022db27
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:17.677000+00:00
-- started: 2026-08-03T09:50:17.780000+00:00
-- ended: 2026-08-03T09:50:18.015000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
