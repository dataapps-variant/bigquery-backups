-- job_id: c41685d9-51c6-4317-87a6-8240b1695a44
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:51.155000+00:00
-- started: 2026-08-03T09:32:51.269000+00:00
-- ended: 2026-08-03T09:32:51.446000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
