-- job_id: 9899fcb0-067b-4a4d-a72f-297d29cdd862
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:46:09.379000+00:00
-- started: 2026-08-03T09:46:09.622000+00:00
-- ended: 2026-08-03T09:46:09.883000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
