-- job_id: f68a4ed4-02de-420e-a2e1-54edab72ffe0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:39.859000+00:00
-- started: 2026-08-03T13:02:39.968000+00:00
-- ended: 2026-08-03T13:02:40.158000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
