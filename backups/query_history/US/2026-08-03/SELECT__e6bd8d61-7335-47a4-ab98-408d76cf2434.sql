-- job_id: e6bd8d61-7335-47a4-ab98-408d76cf2434
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:34.495000+00:00
-- started: 2026-08-03T12:28:34.579000+00:00
-- ended: 2026-08-03T12:28:35.149000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
