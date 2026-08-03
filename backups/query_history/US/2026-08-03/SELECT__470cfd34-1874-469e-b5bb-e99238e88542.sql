-- job_id: 470cfd34-1874-469e-b5bb-e99238e88542
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:52.690000+00:00
-- started: 2026-08-03T09:05:52.799000+00:00
-- ended: 2026-08-03T09:05:52.967000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
