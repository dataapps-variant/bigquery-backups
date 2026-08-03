-- job_id: 2999943f-cdbf-44d9-bb9e-5d347cdfb118
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:44.505000+00:00
-- started: 2026-08-03T12:38:44.623000+00:00
-- ended: 2026-08-03T12:38:44.819000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
