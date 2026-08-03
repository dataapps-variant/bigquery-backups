-- job_id: e82c6b65-3d9b-41a0-8756-73534fa937d6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:30.952000+00:00
-- started: 2026-08-03T13:03:31.024000+00:00
-- ended: 2026-08-03T13:03:31.228000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
