-- job_id: 31878321-6a5d-4806-9337-3f68eef5c41c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:08.708000+00:00
-- started: 2026-07-28T10:02:08.783000+00:00
-- ended: 2026-07-28T10:02:10.866000+00:00


    SELECT COUNT(*) AS n, COUNT(DISTINCT Input_ID) AS inputs
    FROM `variant-finance-data-project.R100.R100_Historical_Main`
