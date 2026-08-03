-- job_id: d2b10ccd-0b1b-48b1-a9b4-df1e0f14bfa6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:59.033000+00:00
-- started: 2026-08-03T09:05:59.225000+00:00
-- ended: 2026-08-03T09:05:59.387000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
