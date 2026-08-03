-- job_id: 639cf9c4-2b45-4d05-9c79-3efdd4244bbc
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:11:24.022000+00:00
-- started: 2026-07-30T16:11:24.152000+00:00
-- ended: 2026-07-30T16:11:25.584000+00:00


    SELECT COUNT(*) AS n, COUNT(DISTINCT Input_ID) AS inputs, ROUND(SUM(spend_usd), 2) AS spend
    FROM `variant-finance-data-project.R100.R100_Historical_Spend`
