-- job_id: 1818160d-f315-4a25-829f-c516ffe86e3d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:08.052000+00:00
-- started: 2026-08-03T12:30:08.109000+00:00
-- ended: 2026-08-03T12:30:08.273000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
