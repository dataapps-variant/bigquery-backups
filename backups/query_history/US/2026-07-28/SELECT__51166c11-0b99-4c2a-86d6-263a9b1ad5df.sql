-- job_id: 51166c11-0b99-4c2a-86d6-263a9b1ad5df
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:59:29.552000+00:00
-- started: 2026-07-28T09:59:29.648000+00:00
-- ended: 2026-07-28T09:59:31.439000+00:00


    SELECT COUNT(*) AS n, COUNT(DISTINCT Input_ID) AS inputs
    FROM `variant-finance-data-project.R100.R100_Historical_Main`
