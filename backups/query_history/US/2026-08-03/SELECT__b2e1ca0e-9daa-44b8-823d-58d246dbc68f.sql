-- job_id: b2e1ca0e-9daa-44b8-823d-58d246dbc68f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:50.448000+00:00
-- started: 2026-08-03T12:38:50.520000+00:00
-- ended: 2026-08-03T12:38:50.750000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
