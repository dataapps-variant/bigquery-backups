-- job_id: 7fbd1b72-c02d-432a-9462-b2190fcaff8b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:06.196000+00:00
-- started: 2026-08-03T10:11:06.246000+00:00
-- ended: 2026-08-03T10:11:06.437000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
