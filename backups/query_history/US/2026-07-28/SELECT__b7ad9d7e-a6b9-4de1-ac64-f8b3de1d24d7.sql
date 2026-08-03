-- job_id: b7ad9d7e-a6b9-4de1-ac64-f8b3de1d24d7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:29:30.544000+00:00
-- started: 2026-07-28T14:29:30.655000+00:00
-- ended: 2026-07-28T14:29:32.374000+00:00


    SELECT COUNT(*) AS n, COUNT(DISTINCT Input_ID) AS inputs
    FROM `variant-finance-data-project.R100.R100_Historical_Main`
