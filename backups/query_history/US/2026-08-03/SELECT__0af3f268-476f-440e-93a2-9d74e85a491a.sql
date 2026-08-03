-- job_id: 0af3f268-476f-440e-93a2-9d74e85a491a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:06.417000+00:00
-- started: 2026-08-03T11:53:06.503000+00:00
-- ended: 2026-08-03T11:53:06.687000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
