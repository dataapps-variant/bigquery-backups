-- job_id: ad203a81-ed5d-4cf1-88da-1113aec1eac0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:44.460000+00:00
-- started: 2026-08-03T11:51:44.563000+00:00
-- ended: 2026-08-03T11:51:44.822000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
