-- job_id: cd3554c3-63b2-4e1f-9ab6-320fefa5498b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:40.471000+00:00
-- started: 2026-08-03T10:09:40.551000+00:00
-- ended: 2026-08-03T10:09:40.758000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
