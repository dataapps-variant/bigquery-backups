-- job_id: 185264cf-762e-477d-9bb4-dfa6e67927ea
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:11.164000+00:00
-- started: 2026-08-03T11:53:11.266000+00:00
-- ended: 2026-08-03T11:53:11.558000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
