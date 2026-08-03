-- job_id: d581ed7e-f974-4c3d-9c06-94bc23a9fcc3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:44.086000+00:00
-- started: 2026-08-03T10:09:44.149000+00:00
-- ended: 2026-08-03T10:09:44.341000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
