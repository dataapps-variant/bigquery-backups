-- job_id: 78f51fda-87b3-4ba6-af36-9c3aa2866beb
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:30.394000+00:00
-- started: 2026-08-03T09:13:30.517000+00:00
-- ended: 2026-08-03T09:13:30.690000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
