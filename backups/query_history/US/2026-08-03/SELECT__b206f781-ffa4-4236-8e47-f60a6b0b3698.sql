-- job_id: b206f781-ffa4-4236-8e47-f60a6b0b3698
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:00.374000+00:00
-- started: 2026-08-03T10:11:00.550000+00:00
-- ended: 2026-08-03T10:11:00.740000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
