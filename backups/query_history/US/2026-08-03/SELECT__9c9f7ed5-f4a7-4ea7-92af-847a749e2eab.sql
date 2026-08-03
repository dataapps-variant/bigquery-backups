-- job_id: 9c9f7ed5-f4a7-4ea7-92af-847a749e2eab
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:37.027000+00:00
-- started: 2026-08-03T10:09:37.106000+00:00
-- ended: 2026-08-03T10:09:37.256000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
