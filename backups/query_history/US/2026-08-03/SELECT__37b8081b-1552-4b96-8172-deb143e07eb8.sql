-- job_id: 37b8081b-1552-4b96-8172-deb143e07eb8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:51.422000+00:00
-- started: 2026-08-03T13:01:51.559000+00:00
-- ended: 2026-08-03T13:01:51.851000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
