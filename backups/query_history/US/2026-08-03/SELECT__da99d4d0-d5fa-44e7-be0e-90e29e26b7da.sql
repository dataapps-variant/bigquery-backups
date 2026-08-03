-- job_id: da99d4d0-d5fa-44e7-be0e-90e29e26b7da
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:53.338000+00:00
-- started: 2026-08-03T12:38:53.408000+00:00
-- ended: 2026-08-03T12:38:53.567000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
