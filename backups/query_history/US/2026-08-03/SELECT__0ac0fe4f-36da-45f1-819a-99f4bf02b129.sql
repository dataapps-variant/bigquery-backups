-- job_id: 0ac0fe4f-36da-45f1-819a-99f4bf02b129
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:16.178000+00:00
-- started: 2026-08-03T12:30:16.275000+00:00
-- ended: 2026-08-03T12:30:16.506000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
